From: Huang, Kai <kai.huang@intel.com>
Date: Fri, 24 May 2024 10:48:55 +1200
Subject: [PATCH v2 0/6] KVM: Fold kvm_arch_sched_in() into
 kvm_arch_vcpu_load()
In-Reply-To: <20240522014013.1672962-1-seanjc@google.com>
References: <20240522014013.1672962-1-seanjc@google.com>
Message-ID: <0a295336-c211-4d4c-abbf-a552e6f0a94c@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 22/05/2024 1:40 pm, Sean Christopherson wrote:
> Drop kvm_arch_sched_in() and instead add and use kvm_vcpu.scheduled_out
> to communicate to kvm_arch_vcpu_load() that the vCPU is being scheduling
> back in.
> 

For this series,

Acked-by: Kai Huang <kai.huang@intel.com>

