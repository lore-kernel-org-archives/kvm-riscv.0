From: Oliver Upton <oliver.upton@linux.dev>
Date: Tue, 24 Jan 2023 17:17:37 +0000
Subject: [PATCH 6/7] KVM: Allow range-based TLB invalidation from common
 code
In-Reply-To: <20230119173559.2517103-7-dmatlack@google.com>
References: <20230119173559.2517103-1-dmatlack@google.com>
 <20230119173559.2517103-7-dmatlack@google.com>
Message-ID: <Y9ASsTwZlZDxx5pv@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 19, 2023 at 09:35:58AM -0800, David Matlack wrote:
> Make kvm_flush_remote_tlbs_range() visible in common code and create a
> default implementation that just invalidates the whole TLB.
> 
> This paves the way for several future cleanups:
>  - Introduction of range-based TLBI on ARM.

nit: this is definitely a new feature, not a cleanup :)

--
Thanks,
Oliver

