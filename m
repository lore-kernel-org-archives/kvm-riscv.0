From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 29 Feb 2024 15:05:48 +0100
Subject: [PATCH 0/6] Add riscv tests to cover the base extension specs
In-Reply-To: <20240229124246.309304-1-cem@kernel.org>
References: <20240229124246.309304-1-cem@kernel.org>
Message-ID: <20240229-24c619ea4927156d28f68f74@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 29, 2024 at 01:42:06PM +0100, cem at kernel.org wrote:
> From: Carlos Maiolino <cem@kernel.org>
> 
> Hi,
> 
> this is my first attempt to create tests to cover some functions of the riscv's
> SBI base implementation spec. The series also includes a couple helpers to
> reduce code duplication.
> 
> Carlos Maiolino (6):
>   riscv: Add test to probe SBI Extension
>   riscv: Factor out environment variable check
>   riscv: Implement test for architecture ID register
>   riscv: Enable gen_report() to print the wrong value in case of test
>     failure
>   riscv: Test for specific SBI implementation ID
>   riscv: Test for a SBI implementation ID range
> 
>  riscv/sbi.c | 95 ++++++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 83 insertions(+), 12 deletions(-)
> 
> -- 
> 2.43.2

Hi Carlos,

If you can, please CC tech-prs at lists.riscv.org when posting SBI tests.

Thanks,
drew

