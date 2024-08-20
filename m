From: Anup Patel <anup@brainfault.org>
Date: Tue, 20 Aug 2024 11:10:11 +0530
Subject: [PATCH 0/2] Fixes for KVM PMU trap/emulation
In-Reply-To: <20240816-kvm_pmu_fixes-v1-0-cdfce386dd93@rivosinc.com>
References: <20240816-kvm_pmu_fixes-v1-0-cdfce386dd93@rivosinc.com>
Message-ID: <CAAhSdy33bSGOr6122MBzuLFP1-dQ45LRbd9zQMDPXf_zQDVNvA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 16, 2024 at 12:38?PM Atish Patra <atishp@rivosinc.com> wrote:
>
> This series contains two small fixes to improve the KVM PMU trap/emulation
> code. The issue can be observed if SBI PMU is disabled or forced the kvm
> to use hpmcounter31.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
> Atish Patra (2):
>       RISC-V: KVM: Allow legacy PMU access from guest
>       RISC-V: KVM: Fix to allow hpmcounter31 from the guest

Queued this patch for Linux-6.11 fixes.

Regards,
Anup

>
>  arch/riscv/include/asm/kvm_vcpu_pmu.h | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> ---
> base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
> change-id: 20240729-kvm_pmu_fixes-26754d2a077d
> --
> Regards,
> Atish patra
>

