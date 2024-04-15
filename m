From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 15 Apr 2024 15:36:02 +0200
Subject: [PATCH v6 23/24] KVM: riscv: selftests: Add a test for counter
 overflow
In-Reply-To: <20240411000752.955910-24-atishp@rivosinc.com>
References: <20240411000752.955910-1-atishp@rivosinc.com>
 <20240411000752.955910-24-atishp@rivosinc.com>
Message-ID: <20240415-418eb2e18cfeb613d252fff0@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 10, 2024 at 05:07:51PM -0700, Atish Patra wrote:
> Add a test for verifying overflow interrupt. Currently, it relies on
> overflow support on cycle/instret events. This test works for cycle/
> instret events which support sampling via hpmcounters on the platform.
> There are no ISA extensions to detect if a platform supports that. Thus,
> this test will fail on platform with virtualization but doesn't
> support overflow on these two events.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  .../selftests/kvm/riscv/sbi_pmu_test.c        | 113 ++++++++++++++++++
>  1 file changed, 113 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

