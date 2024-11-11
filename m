From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 11 Nov 2024 15:36:30 +0100
Subject: [kvm-unit-tests PATCH v2 0/3] lib/on-cpus: A couple of fixes
In-Reply-To: <20241031123948.320652-5-andrew.jones@linux.dev>
References: <20241031123948.320652-5-andrew.jones@linux.dev>
Message-ID: <20241111-ef3ba6e132792aaf8ad901f7@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 31, 2024 at 01:39:49PM +0100, Andrew Jones wrote:
> While creating riscv SBI HSM tests a couple strange on-cpus behaviors
> were observed. Fix 'em.
> 
> v2:
>  - Added patch for barrier after func() [Alex]
>  - Improved commit message for patch1 [Alex]
> 
> Andrew Jones (3):
>   lib/on-cpus: Correct and simplify synchronization
>   lib/on-cpus: Add barrier after func call
>   lib/on-cpus: Fix on_cpumask
> 
>  lib/cpumask.h | 14 +++++++++++++
>  lib/on-cpus.c | 56 ++++++++++++++++++++-------------------------------
>  2 files changed, 36 insertions(+), 34 deletions(-)
> 
> -- 
> 2.47.0
>

Merged to master through riscv/queue.

Thanks,
drew

