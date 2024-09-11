From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 11 Sep 2024 11:58:44 +0200
Subject: [kvm-unit-tests PATCH 0/2] riscv: sbi: Clean up multiple report
 prefix popping
In-Reply-To: <20240910150842.156949-1-jamestiotio@gmail.com>
References: <20240910150842.156949-1-jamestiotio@gmail.com>
Message-ID: <20240911-f1f2d6285391edffc5b63331@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 10, 2024 at 11:08:40PM GMT, James Raphael Tiovalen wrote:
> The first patch of this series adds a helper method to clear multiple
> prefixes at once. The second patch then uses this new helper method to
> tidy up the report prefix pops in the RISC-V SBI tests.
> 
> James Raphael Tiovalen (2):
>   lib/report: Add helper method to clear multiple prefixes
>   riscv: sbi: Tidy up report prefix pops
> 
>  lib/libcflat.h |  1 +
>  lib/report.c   | 21 +++++++++++++++------
>  riscv/sbi.c    | 17 +++++------------
>  3 files changed, 21 insertions(+), 18 deletions(-)
> 
> --
> 2.43.0
>

Looks good to me. There are no longer any double pops in riscv. Out of
curiosity, I checked the other architectures. arm and ppc both had one
instance of double pop, x86 didn't have any, but s390x had several. We
can leave the adoption of popn to the respective maintainer's preferences
though.

Applied to riscv/sbi, https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/riscv/sbi

Thanks,
drew

