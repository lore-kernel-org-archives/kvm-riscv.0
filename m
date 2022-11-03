From: Sean Christopherson <seanjc@google.com>
Date: Thu, 3 Nov 2022 17:44:51 +0000
Subject: [PATCH 36/44] KVM: x86: Do compatibility checks when onlining CPU
In-Reply-To: <23bfd709-f99a-5a74-e4b9-1381b88453f1@redhat.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-37-seanjc@google.com>
 <23bfd709-f99a-5a74-e4b9-1381b88453f1@redhat.com>
Message-ID: <Y2P+E+631c0TNcK7@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 03, 2022, Paolo Bonzini wrote:
> On 11/3/22 00:19, Sean Christopherson wrote:
> > From: Chao Gao<chao.gao@intel.com>
> > 
> > Do compatibility checks when enabling hardware to effectively add
> > compatibility checks when onlining a CPU.  Abort enabling, i.e. the
> > online process, if the (hotplugged) CPU is incompatible with the known
> > good setup.
> 
> This paragraph is not true with this patch being before "KVM: Rename and
> move CPUHP_AP_KVM_STARTING to ONLINE section".

Argh, good eyes.  Getting the ordering correct in this series has been quite the
struggle.  Assuming there are no subtle dependencies between x86 and common KVM,
the ordering should be something like this:

  KVM: Opt out of generic hardware enabling on s390 and PPC
  KVM: Register syscore (suspend/resume) ops early in kvm_init()
  KVM: x86: Do compatibility checks when onlining CPU
  KVM: SVM: Check for SVM support in CPU compatibility checks
  KVM: VMX: Shuffle support checks and hardware enabling code around
  KVM: x86: Do VMX/SVM support checks directly in vendor code
  KVM: x86: Unify pr_fmt to use module name for all KVM modules
  KVM: x86: Use KBUILD_MODNAME to specify vendor module name
  KVM: Make hardware_enable_failed a local variable in the "enable all" path
  KVM: Use a per-CPU variable to track which CPUs have enabled virtualization
  KVM: Remove on_each_cpu(hardware_disable_nolock) in kvm_exit()
  KVM: Drop kvm_count_lock and instead protect kvm_usage_count with kvm_lock
  KVM: Disable CPU hotplug during hardware enabling
  KVM: Rename and move CPUHP_AP_KVM_STARTING to ONLINE section
  KVM: Drop kvm_arch_check_processor_compat() hook

