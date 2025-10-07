Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092D7CCD186
	for <kvm-riscv@archiver.kernel.org>; Tue,  7 Oct 2025 13:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=n3KHxnMIo4hp+3m2vCU7rgo9l2BxIF52PkXfJ7Nyfpw=; b=ftI+guu/zwFKIqDOx8r5X2m7Kh
	kkAYgrx8Bm1mDVzfM3MZ70KuzWMKPL4GTTCrvxWlI8xK44Aeh4ol5kCuxU9S7+YizFV8hHmUhlqaC
	8BKXThkQPVAhW0lyD8JgguwMt5p1AI0jfVevbtkQcIj0PqujBQsU45Z2QbLYL3K/+6nanxdmKKVE7
	JcaGGkNCuASetLpykL7JqTGYkhtpOeSZx1Af4UQ6UnFdUA1C8SHxInB8j2UFAoHRSaYlyeqrjFTbA
	/Cpj2zlvdrMUanDIfY5GIYws4lCKNSKMTtXIn3LSwvCrcNWABHQbOAiS75ki7lLxr9s/cwv7g7XUj
	WB3SRbxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v68Cv-0000000277v-1gLE;
	Tue, 07 Oct 2025 13:58:25 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v68Cr-0000000274I-2Jan
	for kvm-riscv@lists.infradead.org;
	Tue, 07 Oct 2025 13:58:23 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-32eb18b5659so5317848a91.2
        for <kvm-riscv@lists.infradead.org>; Tue, 07 Oct 2025 06:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759845500; x=1760450300; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4rlYUY99rqPM8GfD927WUvhieIqn1G/yd0+acs0pn14=;
        b=O+tiPMlWj/As0ZGtJKWuPbXJXnuXbwiSQk1WMF6OI5+xlLCyS14AkXt/lSAqN/QU83
         FWvfM+2iOr8mwFItZNtJ3SabMgKmGSx/TKPB6IkqVNKt9V7+ZUxKFONQtzuxZuXb8cNz
         X25K+eB1VhsJbr7VpUSjx78pxpY8ohUFEnIVvQu4+wWX8wqvf/Vk2LasYiNIfbqlWekm
         G9W3i3SMF8PQpxT/3/iCR0woRDou304AEp3GxPr5LklJtXvczZKLnKSJnOF199oC23Jj
         qBtnn9W0wt0nkFlBxmmpWTJDd9J3xVMzlaXtCXSYm7kKX5oQBX8jtX9bwiIKnSMp2aAo
         hG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759845500; x=1760450300;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4rlYUY99rqPM8GfD927WUvhieIqn1G/yd0+acs0pn14=;
        b=wu/EdXXG+awZV0SCItbvJGd5rMh7N0URuRpaCEovVH4KNGod1sjd5ij6x/nwB6kTkv
         XGsRcKOv4nm5Wzy01nce0KwHSL0ceiOgXRrcrWEYEzUZDmnrInGtir33MiYwx7R+hNv6
         SeW5D7SFq5DeGlpLmcRFsl5OW4Gv+1cGwYM+lGPvvgfMTCbqfInivKwR6TMUPX/yIKZe
         vfzxP+mM37AhCKURgx1TYvDqPhXVb+YtFsMzLyaEknUodNaeglw6xOjWRrpcXk+6mL7H
         jsPLCgQthSGl1tMixevZ0HnxKmEbpGi8lwvB8kobU0WjsppFkiQxFcE8aOHF9rcNT677
         Opyw==
X-Forwarded-Encrypted: i=1; AJvYcCV1p8an9dAPlgH5q5k9E9x6xOEDXyeA+92ZYjii97LRnnKLZX8hRXhppmzt4y206tV/OjWvtAXDlPI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0XHSXQN4b6lX+Jj12IXfOlyyQYzsmMMrvnbKZINhl7dEYIUM1
	9HlnuBFf4KZ87XzzcJiQCtIj5bJZu5PMp3QXX+FtSu2Yq/zCUWwHZx30WXGKSRgR12mxmYnQM04
	b/M1Bmw==
X-Google-Smtp-Source: AGHT+IH44LYFtR2Z9aj26aSM38dj+lWGcrky74kzzSLe1xZuZzZCEhZOyIjquiME0rIkS/AaVEe3J4tloO4=
X-Received: from pjbmw12.prod.google.com ([2002:a17:90b:4d0c:b0:329:b272:45a7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c05:b0:335:2823:3686
 with SMTP id 98e67ed59e1d1-339c274089dmr20831446a91.2.1759845499915; Tue, 07
 Oct 2025 06:58:19 -0700 (PDT)
Date: Tue, 7 Oct 2025 06:58:18 -0700
In-Reply-To: <fc0bb268-07b7-41ef-9a82-791d381f56ac@amazon.com>
Mime-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-16-pbonzini@redhat.com>
 <fc0bb268-07b7-41ef-9a82-791d381f56ac@amazon.com>
Message-ID: <aOUceqlAnsjQ8mo4@google.com>
Subject: Re: [PATCH 15/34] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Nikita Kalyazin <kalyazin@amazon.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Xu Yilun <yilun.xu@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Anish Moorthy <amoorthy@google.com>, David Matlack <dmatlack@google.com>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_065821_588582_492D7CCD 
X-CRM114-Status: GOOD (  21.87  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Oct 03, 2025, Nikita Kalyazin wrote:
> On 05/11/2023 16:30, Paolo Bonzini wrote:
> > From: Sean Christopherson <seanjc@google.com>
> > 
> > Introduce an ioctl(), KVM_CREATE_GUEST_MEMFD, to allow creating file-based
> > memory that is tied to a specific KVM virtual machine and whose primary
> > purpose is to serve guest memory.
> 
> ...
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index f1a575d39b3b..8f46d757a2c5 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> 
> ...
> 
> > -static int check_memory_region_flags(const struct kvm_userspace_memory_region2 *mem)
> > +static int check_memory_region_flags(struct kvm *kvm,
> > +				     const struct kvm_userspace_memory_region2 *mem)
> >   {
> >   	u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES;
> > +	if (kvm_arch_has_private_mem(kvm))
> > +		valid_flags |= KVM_MEM_GUEST_MEMFD;
> > +
> > +	/* Dirty logging private memory is not currently supported. */
> > +	if (mem->flags & KVM_MEM_GUEST_MEMFD)
> > +		valid_flags &= ~KVM_MEM_LOG_DIRTY_PAGES;
> 
> I was wondering whether this restriction is still required at this stage or
> can be lifted in cases where the guest memory is accessible by the host.

Off the top of my head, I can't think of any reason why dirty logging wouldn't
work with guest_memfd for non-CoCo VMs.  We'd likely need to explicitly enumerate
support to userspace, and there might be some assumptions lurking in KVM, but
fundamentally it should Just Work (TM).

> Specifically, it would be useful to support differential memory snapshots
> based on dirty page tracking in Firecracker [1] or in live migration.  As an
> experiment, I removed the check and was able to produce a diff snapshot and
> restore a Firecracker VM from it.
> 
> [1] https://github.com/firecracker-microvm/firecracker/blob/main/docs/snapshotting/snapshot-support.md#creating-diff-snapshots
> 
> > +
> >   #ifdef __KVM_HAVE_READONLY_MEM
> >   	valid_flags |= KVM_MEM_READONLY;
> >   #endif
> > @@ -2018,7 +2029,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
> >   	int as_id, id;
> >   	int r;
> > -	r = check_memory_region_flags(mem);
> > +	r = check_memory_region_flags(kvm, mem);
> >   	if (r)
> >   		return r;

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
