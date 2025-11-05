Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506F6CCFA0D
	for <kvm-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 15:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YY0r02lZHPTfbcq6UKeizvRJAEuXGW6C6TNYAm1jIFs=; b=Kxq+slVpINO/migmFw0Oivm3lm
	jfgzbtFPi/iJE4YQP+mOZZqmbIy8aTfLH4zeL+n1kILmknazl2uH9ueee2So6+MNbFJfdRZrrop33
	roeLkrBDr94SA9yP16D0jyM4ryxXyjsyjp7m5cdfwyuOhcDTWGs+bl1jtRVr09bH0bWhvRld7f8OO
	jEbaUCb7cpOYTeIJGBFZ7rl2yKuDWPwUjsk5DwqgHAyxRkVypfBN6Jk37JwiwPEWSvMvmF6HwEW+/
	UIw8XKBTz41yUFH4GtWkQ4rDHZTcrWxSRum6ZfyEbkPlyPA85Q7RzZ24UHOkt1NW4TwTP+zpUOoKl
	GhHBjwEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfPE-0000000Dw3l-02KA;
	Wed, 05 Nov 2025 15:26:40 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfPA-0000000Dw2M-18iW
	for kvm-riscv@lists.infradead.org;
	Wed, 05 Nov 2025 15:26:38 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-341616a6fb7so4125a91.0
        for <kvm-riscv@lists.infradead.org>; Wed, 05 Nov 2025 07:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762356395; x=1762961195; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dmjmfo22QwufKip+RFN2GwcKXDk7+fDMohFzNqFh1wo=;
        b=iDewj5jzpJ4BBrzV4dZGab58MK62rovLkvr+hG4RFcoGHlYhQv7iLb2JGDGOwxK9dG
         jtf7FF1RAcPgZhrqCQjjmO0qA7gXYDXGUBPkerDVd4wRMlYcBxzSaJspRzcrnoTufLx3
         dnabE8POzccSz7v+pMgInT10JnK6JxxY1DPf4SR1gBbSBtQmfvDYuSRpozIdnd6RpAd3
         xjwMhGgeJwqKPqN+H4uNLDSSfz0HtRY/y+3PiZtUVhMPxhZvIr3HWRlBCJmjAnF5wLyf
         nDF/UHn8LuZKREmY93wNgMGRX7nYM9Bgstq5reSDHh00uhZkIEytjxTV87HcO8w44EzR
         IgVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762356395; x=1762961195;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dmjmfo22QwufKip+RFN2GwcKXDk7+fDMohFzNqFh1wo=;
        b=hJ1z8ijOQYSUnpwMVtrbT8KTW6ZVyGZxFIRRJVM9RUTeaPJbbvHgIvD9+Y/ciq6ZEr
         Kwc6T19b7yYleHywUoS+0fn2/uxIx2GtvaS5ZR3C8h5yaSzMivlU5zj9kYlaTJCqQeit
         f3jz+NU9DXV1BUJBPAXP23UbDRHIf8VW4ezJdNEMBF8/cKZ3ISdlDtC8pxwZoyK8zyUI
         uwcKdIrBmjluN2gK6SofDGsBqUExd5o0wyl1tYelTLIZS8m3JOhhI+M2/SH5jZlYfSPf
         L+db9JcrQO2S9bJZ/jzkvplzJDXkruXMQV5Lo6041muVWy/G2zFjLj75ZlT/ArQ2av3U
         h9LA==
X-Forwarded-Encrypted: i=1; AJvYcCV/3i3qMyhsnfkLJ6tVWpAIxCGxV7jC3G6vmon7SJrsL6eVcScZ2u9tOC7pJ9O9K7NiJ+FjtHi05k8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwLkrjt6zGK+VunloGgRG2HUwYMzm9iFdg86vW5+ZNH8V8Ub7pv
	7TAfPeJ0HImr/kPMjccuWT7p9xu1Ppcvf8h/qPtgQ5mG7yrQRSO/Gi87raQuaTG4Op8dbjrn4sQ
	1YU5gDg==
X-Google-Smtp-Source: AGHT+IEksiko2nLkYHDcuQoizh41Xk4dhEPlLcSxUswEaWhydqjlp9gNPv6q5VYl/pXem0FsGEVxprPZGIk=
X-Received: from pjbtc7.prod.google.com ([2002:a17:90b:5407:b0:340:b503:505f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:384d:b0:340:9cf1:54d0
 with SMTP id 98e67ed59e1d1-341a6c08e65mr4623520a91.1.1762356395074; Wed, 05
 Nov 2025 07:26:35 -0800 (PST)
Date: Wed, 5 Nov 2025 07:26:33 -0800
In-Reply-To: <aQsBI1/SIXGbf9nA@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-5-seanjc@google.com>
 <aPhjYcOFjL1Z8m2s@yzhao56-desk.sh.intel.com> <aQMi/n9DVyeaWsVH@yzhao56-desk.sh.intel.com>
 <aQo-hus99rE7WBgb@google.com> <aQr9jW/7zwWJaDFf@yzhao56-desk.sh.intel.com> <aQsBI1/SIXGbf9nA@yzhao56-desk.sh.intel.com>
Message-ID: <aQtsqXPaZo2SMdJU@google.com>
Subject: Re: [PATCH v3 04/25] KVM: x86/mmu: Add dedicated API to map
 guest_memfd pfn into TDP MMU
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
X-CRM114-CacheID: sfid-20251105_072636_317200_722821AA 
X-CRM114-Status: GOOD (  24.10  )
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

On Wed, Nov 05, 2025, Yan Zhao wrote:
> On Wed, Nov 05, 2025 at 03:32:29PM +0800, Yan Zhao wrote:
> > On Tue, Nov 04, 2025 at 09:57:26AM -0800, Sean Christopherson wrote:
> > > On Thu, Oct 30, 2025, Yan Zhao wrote:
> > > > On Wed, Oct 22, 2025 at 12:53:53PM +0800, Yan Zhao wrote:
> > > > > On Thu, Oct 16, 2025 at 05:32:22PM -0700, Sean Christopherson wrote:
> > > > > > Link: https://lore.kernel.org/all/20250709232103.zwmufocd3l7sqk7y@amd.com
> > > > > 
> > > > > Hi Sean,                                                                         
> > > > > 
> > > > > Will you post [1] to fix the AB-BA deadlock issue for huge page in-place
> > > > > conversion as well?
> > > 
> > > If you (or anyone) has the bandwidth, please pick it up.  I won't have cycles to
> > > look at that for many weeks (potentially not even this calendar year).
> > Got it!
> > On the other hand, do you think we can address the warning as below?
> > The code is based on [2].
> Hmm, updated the diff.
> 
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 7b4a4474d468..543e1eb9db65 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -853,6 +853,9 @@ static int kvm_gmem_init_inode(struct inode *inode, loff_t size, u64 flags)
>         inode->i_size = size;
>         mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
>         mapping_set_inaccessible(inode->i_mapping);
> +       if (flags &GUEST_MEMFD_FLAG_MMAP)
> +               lockdep_set_subclass(&inode->i_mapping->invalidate_lock, 1);
> +
>         /* Unmovable mappings are supposed to be marked unevictable as well. */
>         WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
> 
>  
> > As noted in [3], the only scenario can trigger the warning after [2] is when a
> > process creates a TDX VM with non-in-place-conversion guest_memfd and a normal
> > VM with in-place-conversion guest_memfd. The two invalidate_lock's don't contend
> > with each other theoretically.

Hmm, no, I think we need to hoist gup() call outside of filemap_invalidate_lock(),
because I don't think this is strictly limited to TDX VMs without in-place
conversion.  Even with in-place conversion, I think KVM should allow the source
page to be shared memory, at which point I believe this becomes a legimate AB-BA
issue.

In general, playing lockdep games with so many subsystems involved terrifies me.

> > [2] https://lore.kernel.org/all/cover.1760731772.git.ackerleytng@google.com/
> > [3] https://lore.kernel.org/all/aQMi%2Fn9DVyeaWsVH@yzhao56-desk.sh.intel.com/

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
