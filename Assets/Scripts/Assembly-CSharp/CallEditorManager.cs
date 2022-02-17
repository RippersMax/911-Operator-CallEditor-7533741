using Call911.General;
using UnityEngine;
using UnityEngine.UI;

public class CallEditorManager : Singleton<CallEditorManager>
{
	public GameObject conversationWindow;
	public GameObject propertiesWindow;
	public GameObject filePanel;
	public Button fileButton;
	public Button propertiesButton;
	public Button newEditorObjButton;
	public Button newDialTransitionButton;
	public RectTransform dialogsContainer;
	public RectTransform sceneContainer;
	public RectTransform aarContainer;
	public Transform[] convContainerTab;
	public Sprite operatorIcon;
	public Sprite callerIcon;
	public GameObject conversationButtPrefab;
	public GameObject dialogOptionPrefab;
	public GameObject dialogLinePrefab;
	public GameObject wideDialogOptionPrefab;
	public GameObject baseEditorElementPrefab;
	public GameObject callsTitle;
	public ConversationWindow newConvWindow;
	public ButtonsPostions buttonsManager;
	public ButtonsPostions mainWindowManager;
	public ConversationProperties conversationProperties;
	public DialogProperties activeProperties;
	public bool editTransitions;
}
