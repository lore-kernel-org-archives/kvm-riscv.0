From: Chao Gao <chao.gao@intel.com>
Date: Fri, 2 Dec 2022 16:02:08 +0800
Subject: [PATCH v2 00/50] KVM: Rework kvm_init() and hardware enabling
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
Message-ID: <Y4mxACzVOsJpiIow@gao-cwp>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 30, 2022 at 11:08:44PM +0000, Sean Christopherson wrote:
>The main theme of this series is to kill off kvm_arch_init(),
>kvm_arch_hardware_(un)setup(), and kvm_arch_check_processor_compat(), which
>all originated in x86 code from way back when, and needlessly complicate
>both common KVM code and architecture code.  E.g. many architectures don't
>mark functions/data as __init/__ro_after_init purely because kvm_init()
>isn't marked __init to support x86's separate vendor modules.

Applied this series and verified that an attempt to online incompatible
CPUs (no VMX support) when some VMs are running will fail.

