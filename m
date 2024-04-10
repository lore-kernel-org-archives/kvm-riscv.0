From: Eric Cheng <eric.cheng.linux@gmail.com>
Date: Wed, 10 Apr 2024 15:12:52 +0800
Subject: [PATCH 1/2] RISCV: KVM: add tracepoints for entry and exit events
In-Reply-To: <20240328031220.1287-2-liangshenlin@eswincomputing.com>
References: <20240328031220.1287-1-liangshenlin@eswincomputing.com>
 <20240328031220.1287-2-liangshenlin@eswincomputing.com>
Message-ID: <40a8d9d3-20a8-44e8-96d2-0dcd8627cfc8@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 3/28/2024 11:12 AM, Shenlin Liang wrote:
> Like other architectures, RISCV KVM also needs to add these event
> tracepoints to count the number of times kvm guest entry/exit.
> 
> Signed-off-by: Shenlin Liang <liangshenlin@eswincomputing.com>
> ---
>   arch/riscv/kvm/trace_riscv.h | 60 ++++++++++++++++++++++++++++++++++++

Conventionally, it should be named to trace.h, especially if only one. Refer to 
other arch's.


