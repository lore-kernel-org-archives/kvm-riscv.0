From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 16 Sep 2024 14:38:04 +0200
Subject: [PATCH v3 1/2] riscv: perf: add guest vs host distinction
In-Reply-To: <c62057d587f075a64442df1038fe27b52b89c997.1726126795.git.zhouquan@iscas.ac.cn>
References: <cover.1726126795.git.zhouquan@iscas.ac.cn>
 <c62057d587f075a64442df1038fe27b52b89c997.1726126795.git.zhouquan@iscas.ac.cn>
Message-ID: <20240916-6f21ff3d12224f366ccaac6e@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 12, 2024 at 04:00:29PM GMT, zhouquan at iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> Introduce basic guest support in perf, enabling it to distinguish
> between PMU interrupts in the host or guest, and collect
> fundamental information.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/include/asm/perf_event.h |  7 ++++++
>  arch/riscv/kernel/perf_callchain.c  | 38 +++++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

