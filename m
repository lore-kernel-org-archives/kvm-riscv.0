From: Vipin Sharma <vipinsh@google.com>
Date: Mon, 24 Apr 2023 09:45:18 -0700
Subject: [PATCH 7/9] KVM: mmu: Move mmu lock/unlock to arch code for clear
 dirty log
In-Reply-To: <202304220315.bpwbgH5n-lkp@intel.com>
References: <20230421165305.804301-8-vipinsh@google.com> <202304220315.bpwbgH5n-lkp@intel.com>
Message-ID: <CAHVum0cp=wfDmuK87jq7+2t5FnK09v1LownwqgS41EisT4Gc1g@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 21, 2023 at 12:43?PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Vipin,
>
> All warnings (new ones prefixed by >>):
>
>    arch/riscv/kvm/mmu.c: In function 'kvm_arch_mmu_enable_log_dirty_pt_masked':
> >> arch/riscv/kvm/mmu.c:399:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
>      399 |         phys_addr_t base_gfn = slot->base_gfn + gfn_offset;
>          |         ^~~~~~~~~~~
>
>

I will fix it in v2.

