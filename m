From: Andrew Jones <andrew.jones@linux.dev>
Date: Tue, 3 Sep 2024 15:41:12 +0200
Subject: [kvm-unit-tests PATCH 0/3] riscv: Improve on-cpu and IPI support
In-Reply-To: <20240830101221.2202707-5-andrew.jones@linux.dev>
References: <20240830101221.2202707-5-andrew.jones@linux.dev>
Message-ID: <20240903-97ba8bde2c3c7c1ca97d3bdc@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 30, 2024 at 12:12:22PM GMT, Andrew Jones wrote:
> The first two patches improve general library support for cpumasks and
> the on-cpus API. on-cpus can now take cpumasks for input. The last patch
> improves support for sending IPIs on riscv using the SBI IPI extension
> by supporting a nicer interface of cpuids and cpumasks.
> 
> Andrew Jones (3):
>   lib/cpumask: Fix and simplify a few functions
>   lib/on-cpus: Introduce on_cpumask and on_cpumask_async
>   riscv: Introduce SBI IPI convenience functions
> 
>  lib/cpumask.h       | 47 +++++++++++++++++----------------------------
>  lib/on-cpus.c       | 35 +++++++++++++++++++++++++--------
>  lib/on-cpus.h       |  3 +++
>  lib/riscv/asm/sbi.h |  3 +++
>  lib/riscv/sbi.c     | 43 +++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 94 insertions(+), 37 deletions(-)
> 
> -- 
> 2.45.2

Queued on riscv/sbi, https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/riscv%2Fsbi

