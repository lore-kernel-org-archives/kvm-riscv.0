From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 4 Jan 2024 12:21:05 +0100
Subject: [PATCH] RISC-V: KVM: Require HAVE_KVM
In-Reply-To: <752c11ea-7172-40ff-a821-c78aeb6c5518@ghiti.fr>
References: <20240104104307.16019-2-ajones@ventanamicro.com>
 <20240104-d5ebb072b91a6f7abbb2ac76@orel>
 <752c11ea-7172-40ff-a821-c78aeb6c5518@ghiti.fr>
Message-ID: <20240104-6a5a59dde14adcaf3ac22a35@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 04, 2024 at 12:07:51PM +0100, Alexandre Ghiti wrote:
> On 04/01/2024 11:52, Andrew Jones wrote:
> > This applies to linux-next, but I forgot to append -next to the PATCH
> > prefix.
> 
> 
> Shoudn't this go to -fixes instead? With a Fixes tag?

I'm not sure how urgent it is since it's a randconfig thing, but if we
think it deserves the -fixes track then I can do that. The Fixes tag isn't
super easy to select since, while it seems like it should be 8132d887a702
("KVM: remove CONFIG_HAVE_KVM_EVENTFD"), it could also be 99cdc6c18c2d
("RISC-V: Add initial skeletal KVM support").

I'll leave both the urgency decision and the Fixes tag selection up to
the maintainers. Anup? Paolo?

Thanks,
drew

