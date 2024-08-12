From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 12 Aug 2024 16:18:08 +0200
Subject: [kvm-unit-tests PATCH 0/4] riscv: sbi: More DBCN tests
In-Reply-To: <20240812141354.119889-6-andrew.jones@linux.dev>
References: <20240812141354.119889-6-andrew.jones@linux.dev>
Message-ID: <20240812-067579d76c30484592009ced@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Aug 12, 2024 at 04:13:55PM GMT, Andrew Jones wrote:
> The current DBCN tests found a several bugs and with high address
> support for rv32 we were able to find even more. Add the new tests
> which checks high use page boundary crossing. The first three patches
> a various improvements to the SBI tests.
> 
> Based on riscv/queue, https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/riscv%2Fqueue
> 
> Andrew Jones (4):
>   riscv: sbi: dbcn: Output return values
>   riscv: sbi: Use strtoul to avoid overflow
>   riscv: sbi: Prefix several environment variables with SBI
>   riscv: sbi: dbcn: Add high address tests
> 
>  riscv/sbi.c | 163 +++++++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 131 insertions(+), 32 deletions(-)
> 
> -- 
> 2.45.2
>

Queued on riscv/sbi, https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/riscv%2Fsbi

