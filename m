From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 18 Mar 2024 18:24:09 +0100
Subject: [PATCH V4 0/6] Add riscv tests to cover the base extension specs
In-Reply-To: <20240313215106.325766-1-cem@kernel.org>
References: <20240313215106.325766-1-cem@kernel.org>
Message-ID: <20240318-4db92d2af2562faffcf9829d@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 13, 2024 at 10:50:51PM +0100, cem at kernel.org wrote:
> From: Carlos Maiolino <cem@kernel.org>
> 
> Hi,
> 
> This is a new (V4) version of this series to create tests to cover functions
> of the riscv's SBI base implementation spec. The series also includes a
> a few helpers to reduce code duplication.
> 
> This new version includes updates related to Drew reviews, and rebasing of
> the patches according to the changes. 
> This new series has also been rebased on TOT, didn't affect the patches,
> but worth the heads up.
> 
> Patches tagged with V4 needed modifications from the previous version.
> 
> Detailed updates are specified on a patch-basis
> 
> 
> Carlos Maiolino (6):
>   riscv: Add a wrapper to call sbi_ecall for base extension
>   riscv: Add test to probe SBI Extension
>   riscv: Factor out environment variable check and report generation
>   riscv: Implement test for architecture ID register
>   riscv: Enable gen_report() to print the wrong value in case of failure
>   riscv: Test for specific SBI implementation ID
> 
>  riscv/sbi.c | 81 +++++++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 69 insertions(+), 12 deletions(-)
> 
> -- 
> 2.44.0
>

Merged to https://gitlab.com/kvm-unit-tests/kvm-unit-tests

Thanks,
drew

