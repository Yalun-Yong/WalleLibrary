package ${packageName};

<#if includeCallbacks>import android.content.Context;</#if>
<#if includeCallbacks>import android.net.Uri;</#if>
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android${SupportPackage}.app.Fragment;
<#if !includeLayout>import android.widget.TextView;</#if>
<#if applicationPackage??>
import ${applicationPackage}.R;
</#if>

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.xky.app.patient.base.BaseMVPFragment;
import com.xky.app.patient.databinding.${fragmentBinding};


/**
 *
 * 作者 : 
 * 邮箱 : 
 * desc   :
 * version: 1.0
 
 */
public class ${className}  extends BaseMVPFragment<${contractName}.View,
        ${contractName}.Presenter, ${fragmentBinding}>
        implements ${contractName}.View, View.OnClickListener {


    /*
    * 静态创建对象
    */
    public static ${className} newInstance(@Nullable Bundle fragmentArgumentsBundle) {
        ${className} f = new ${className}();
        f.setArguments(fragmentArgumentsBundle);
        return f;
    }


	 @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Bundle arguments = getArguments();
        if (arguments != null) {
            //type = arguments.getInt(TAB_NAME, type);
        }
		//更换ScrollView+adjustResize,适配有输入相关的
        //getActivity().getWindow().setSoftInputMode(
        //        WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE
        //);
    }

    @Override
    public void onSaveInstanceState(@NonNull Bundle outState) {
        super.onSaveInstanceState(outState);
        if (outState != null) {
            //outState.putInt(TAB_NAME, type);
        }
    }

    @Override
    public void onViewStateRestored(@Nullable Bundle savedInstanceState) {
        super.onViewStateRestored(savedInstanceState);
        if (savedInstanceState != null) {
            //savedInstanceState.getInt(TAB_NAME, type);
        }
    }

    @Override
    public void onClick(View v) {

    }


    @Override
    protected ${contractName}.Presenter createPresenter() {
        return new ${presenterName}();
    }

    @Override
    protected int getInflateRootViewLayoutResID() {
        return R.layout.${fragmentName};
    }


    @Override
    public void onFirstVisibleToUser() {
		mViewBindingFgt.setListener(this);
    }



    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
		super.onActivityResult(requestCode, resultCode, data);
        if (resultCode != Activity.RESULT_OK) {
            return;
        }
    }

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        super.onCreateOptionsMenu(menu, inflater);
        //if (medicalImgBean != null && medicalImgBean.seqno != null) {
        //    menu.getItem(0).setTitle(getString(R.string.MedicalImgRecordFragment_detail_delete));
        //}
    }

    @Override
    public int getMenuResId() {
        //if (medicalImgBean != null && medicalImgBean.seqno != null) {
        //    return R.menu.toobar_right_text_btn;
        //}
        return super.getMenuResId();
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        //if (medicalImgBean != null && medicalImgBean.seqno != null) {
        //    String seqno = medicalImgBean.seqno;
        //    if (item.getItemId() == R.id.menu_toolbar_right_text_btn) {
        //        showDeleteInfoDialog(seqno);
        //       return true;
        //    }
        //}
        return super.onOptionsItemSelected(item);
    }

    public void ${commonUrlName}Success(){

    }

<#if includeFactory>
    // TODO: Rename parameter arguments, choose names that match
    // the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
    private static final String ARG_PARAM1 = "param1";
    private static final String ARG_PARAM2 = "param2";

    // TODO: Rename and change types of parameters
    private String mParam1;
    private String mParam2;
</#if>

<#if includeCallbacks>
    private OnFragmentInteractionListener mListener;
</#if>

<#if includeFactory>
    /**
     * Use this factory method to create a new instance of
     * this fragment using the provided parameters.
     *
     * @param param1 Parameter 1.
     * @param param2 Parameter 2.
     * @return A new instance of fragment ${className}.
     */
    // TODO: Rename and change types and number of parameters
    public static ${className} newInstance(String param1, String param2) {
        ${className} fragment = new ${className}();
        Bundle args = new Bundle();
        args.putString(ARG_PARAM1, param1);
        args.putString(ARG_PARAM2, param2);
        fragment.setArguments(args);
        return fragment;
    }
</#if>
    public ${className}() {
        // Required empty public constructor
    }

<#if includeFactory>
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
            mParam1 = getArguments().getString(ARG_PARAM1);
            mParam2 = getArguments().getString(ARG_PARAM2);
        }
    }
</#if>


<#if includeCallbacks>
    // TODO: Rename method, update argument and hook method into UI event
    public void onButtonPressed(Uri uri) {
        if (mListener != null) {
            mListener.onFragmentInteraction(uri);
        }
    }

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
        if (context instanceof OnFragmentInteractionListener) {
            mListener = (OnFragmentInteractionListener) context;
        } else {
            throw new RuntimeException(context.toString()
                    + " must implement OnFragmentInteractionListener");
        }
    }

    @Override
    public void onDetach() {
        super.onDetach();
        mListener = null;
    }

    /**
     * This interface must be implemented by activities that contain this
     * fragment to allow an interaction in this fragment to be communicated
     * to the activity and potentially other fragments contained in that
     * activity.
     * <p>
     * See the Android Training lesson <a href=
     * "http://developer.android.com/training/basics/fragments/communicating.html"
     * >Communicating with Other Fragments</a> for more information.
     */
    public interface OnFragmentInteractionListener {
        // TODO: Update argument type and name
        void onFragmentInteraction(Uri uri);
    }
</#if>
}
