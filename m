From: Thomas Huth <thuth@redhat.com>
Date: Wed, 24 Jan 2024 10:53:40 +0100
Subject: [kvm-unit-tests PATCH 04/24] arm/arm64: Share cpu online, present
 and idle masks
In-Reply-To: <20240124071815.6898-30-andrew.jones@linux.dev>
References: <20240124071815.6898-26-andrew.jones@linux.dev>
 <20240124071815.6898-30-andrew.jones@linux.dev>
Message-ID: <5f0ba946-8771-4f8a-965a-a454cba86c57@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 24/01/2024 08.18, Andrew Jones wrote:
> RISC-V will also use Arm's three cpumasks. These were in smp.h,
> but they can be in cpumask.h instead, so move them there, which
> is now shared.
> 
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>   lib/arm/asm/smp.h | 33 ---------------------------------
>   lib/cpumask.h     | 33 +++++++++++++++++++++++++++++++++
>   2 files changed, 33 insertions(+), 33 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>



