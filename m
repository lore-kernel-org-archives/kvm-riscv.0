Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D2FCCD1AB
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 19:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pEO31pHwcfpyq2qmB9jj8L6vMJ8mU/vcdMYPirr4hQw=; b=vQrnuvCiAY9fC1LKK81zJwhyR8
	cEwBtR1srUGZ0VU+C8rSEc28UB4qXWBewfofwtgGJP4DuziC7ypG/qtjKcjU9c4ZVmmyg9uxGPWmy
	i0OjBEEdxUX6z5y1yn4yv9sLgaBMV54Xgx3JIldPSS9oif2WLOaNmzsl/hCbxq9lQwMYL/Z4CUceU
	MnKcAoQ9WStfd3FV5xms6Ys/5hAfexgJh+o1razIgBmlvA4L5DGGGGqo9KPdwHz5ZhNVHyV7LUg6i
	1t67PknODC+7TP1dLafJ4yZDhhs77vu7gNgh93MzzvFVfZmfevrEauZYrfF/VdhvW09rx5dAhZT/E
	ZZ150o5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBeCZ-000000045ix-0coF;
	Wed, 22 Oct 2025 19:08:51 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBeCW-000000045hB-3BdB
	for kvm-riscv@lists.infradead.org;
	Wed, 22 Oct 2025 19:08:49 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b557abaad02so11518548a12.3
        for <kvm-riscv@lists.infradead.org>; Wed, 22 Oct 2025 12:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761160127; x=1761764927; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wREzy7rE27X1qKmfXOWprRl7YFBX8aFkFx3LWlFCsNc=;
        b=HXoKXPd4l5qSR0ItKfvY5LIc5Rr021zoJKEixb1FpwfIKGmxPZRR5bipukq24bvTMQ
         azVx1VQWSa/QNvm66Yggs9/1OR5kvGwG6sn79tQsiIBdJqPdA8uHax8wqEaEj97IdCQO
         JBeWcJRG7vZFuoBc7sa+5bI2we0raBOWLYQHIzfDgTMJMF4FaJucizE1nOIcwZLxlzer
         8ImACy9Au89ghqGOWwVRP/ORLNr1QKh8YJv1aMbvsGEduXbENu/ZWhq0VJVYCfv4/vST
         edaH83yTdU2Qf8tC4CDfjhPX1xCaPZizsIDJBqKUEoTtKRb33lsOtHpsZNEhVMLUV5x/
         BoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761160127; x=1761764927;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wREzy7rE27X1qKmfXOWprRl7YFBX8aFkFx3LWlFCsNc=;
        b=BFVNqtmN4ElY1ljsw64HgKWGsyYgyW+WJGMpG3dIolOBgGUE8YwZUtYKY7RYY4Cd7O
         qmy4ZftOH/Tazpqki3eArBmK5hm6l5AB9kHSfjVkNVKd3zp0uxCKo7e/tJMDGJldclj5
         C0VUZJQRcryuZKVuD67ofLDjYniVx5jT39dMDEyX3LP6Mz4taGs8u0OeNsfdrscc4RgC
         JbeFHzkhqlCSTnEhzZURPDGCNcr+a0tQQ/RtgfbMK9YykjN9P2VivRrOCI7QZtKy32KJ
         QJU/XE0Qg34gZQ2DzNN/KGP+Me6VgqFQpWRyWQuW+2I+h3TfgdqwMDh8+a4ZuNXCKf05
         u+Kg==
X-Forwarded-Encrypted: i=1; AJvYcCV8DZdIkdaZtpl8MdqrFbbdS+feQjQSBq9ft6gUgJno5PIrIj9EG15hMPcLGbOtG4JCC8VyNNj+rqc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/kY8VaqI7iQVJHgCRCD4V94GjetpSyGqLfyQ0StmdN3PnKDv9
	sYcl31lMK+PVPP9UedTtVItdX338ILTCPhGGkQVF1jaeHMl8vgk/j9DvnFG317Dhysict9+Bmax
	iXF2Lwg==
X-Google-Smtp-Source: AGHT+IG7bMbvOV7PjecaO9CgeAeXZcwC+wb3hcO8vOg4iH6Jor9tS/5vQmEcVRzTkSnVuCY2g2HzBv4NWV8=
X-Received: from pjbpc16.prod.google.com ([2002:a17:90b:3b90:b0:330:9870:9f18])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:218a:b0:2e5:c9ee:96fa
 with SMTP id adf61e73a8af0-334a861743bmr28027967637.34.1761160127099; Wed, 22
 Oct 2025 12:08:47 -0700 (PDT)
Date: Wed, 22 Oct 2025 12:08:45 -0700
In-Reply-To: <aPiZ2DEQ6qW5r5rY@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-11-seanjc@google.com>
 <aPiZ2DEQ6qW5r5rY@yzhao56-desk.sh.intel.com>
Message-ID: <aPkrvWcm3JF9WlVd@google.com>
Subject: Re: [PATCH v3 10/25] KVM: x86/mmu: Drop the return code from kvm_x86_ops.remove_external_spte()
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Michael Roth <michael.roth@amd.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_120848_797866_EC007BB7 
X-CRM114-Status: GOOD (  15.77  )
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

On Wed, Oct 22, 2025, Yan Zhao wrote:
> On Thu, Oct 16, 2025 at 05:32:28PM -0700, Sean Christopherson wrote:
> > Opportunistically pass the spte instead of the pfn, as the API is clearly
> > about removing an spte.
> >From my perspective, "remove_external_spte" means removing an external SPTE (not
> a mirror SPTE). So passing in pfn_for_gfn seems reasonable as well.
> 
> Additionally, passing in the pfn eliminates potential concerns about incorrect
> spte content.

No, it just makes bugs harder to debug.  E.g. it doesn't magically guarantee the
@pfn matches the pfn that was mapped into the S-EPT.

> > diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> > index 48598d017d6f..7e92aebd07e8 100644
> > --- a/arch/x86/include/asm/kvm_host.h
> > +++ b/arch/x86/include/asm/kvm_host.h
> > @@ -1855,8 +1855,8 @@ struct kvm_x86_ops {
> >  				 void *external_spt);
> >  
> >  	/* Update external page table from spte getting removed, and flush TLB. */
> > -	int (*remove_external_spte)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
> > -				    kvm_pfn_t pfn_for_gfn);
> > +	void (*remove_external_spte)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
> > +				     u64 spte);

Thinking more about what "spte" actually tracks, I think I'll rename it to
"mirror_spte".

> Also update set_external_spte?

Ooh, yeah, good call.  And we can use the mirror_spte information to assert that
KVM expects full RWX permissions, e.g. that we aren't creation a security hole by
letting the guest write memory that KVM thinks is read-only (extreme paranoia,
more for documentation purposes).

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
