Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D456CC71135
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 22:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=s2QLz2fm2P0Zm24k+moWxAGfgzrhlJlOIYP2dcn2WQo=; b=bZaDm3PnzvmWta9568HPCjSI3+
	uDDmkbNNSgQEde5qJk+ItrOzXWnYI5sitFv7FFD/H7ywwvTZBehUNf+KeRoCmkNQTbRTArpvuGYtg
	XldCUthvk6FlSbYmrqKPQj7DxP8+FTaIuJW8yYA1kJxbJXw6HOImMwOWYqsWfYnZure+PH75hDExk
	5MWSyVWnFDWsqHQdNuVIU+r6cdtAHAqhLicRYVEO+tVVhog1q65wER3OkNwyNb6LG3G3DJEEqHg6Q
	+R/jw4A7s6eZK8IL9JEcMtuJwTl0UKOSXUoYz3X1Bq0uyqXnATYzNkZKDI6uVeKAGk2oIYZ+ftBph
	IiKHmaHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQCto-00000000E8R-1dR4;
	Fri, 13 Jun 2025 22:29:24 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQCtm-00000000E7l-05Oh
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 22:29:23 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-313d6d671ffso1515545a91.2
        for <kvm-riscv@lists.infradead.org>; Fri, 13 Jun 2025 15:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749853760; x=1750458560; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ntrF63Vv2zoH9u2B2bhtc6n4yroInyt7sGzPvAgo8Rk=;
        b=Qcryn+P0jOOemVLGMmX/IXmB/PAJlvHgd0oTFRO82mNDdlgw1WFLBnPt80BBptC+Zj
         yVTg8Rb6AZeg9zNzybB3qjLNVcG92ryyehS36FSyNOxjLySL9tm7fGgpxDD3UXR947Kv
         EYv6BPqYew1jjM6qgPLVqRvzsdNOHr8jDQalYYpNEKKdMBoIzv8/ZwHilxbJ5+pJs1N+
         2VTptHIlRHSkyWNemVMMgBSZJCey8KJWuJSMA+TTdtjBkYOvVgW5qzp57hlpz2DCashg
         zyrk05E90bqlaQdCggFLMKaV0r7pHOJPJ/atfJkLfb8oQqWvwDnULJIrDFQCR23qAnAv
         +SJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749853760; x=1750458560;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ntrF63Vv2zoH9u2B2bhtc6n4yroInyt7sGzPvAgo8Rk=;
        b=UEXTbhlM/VzoTPjLgK6dhP1l/7T/JDS8rzGWzxtPPHMUJ7Mzq07Tncwx3fd7qtUftN
         FFtMn1ifEYOb5qMZo1A4uhhGQgN9v19AmerS1ETEENfbqXlRNMXnGen5VlJLpmcqXUea
         POtEwqyMqlYBdjOUuX1ToqTqU5OVm+SiwVxoxDD8vsfOD98c183vx5maJ7w43DsMegj2
         yaMAW8iwx8FRpKm0UziAvtv7q9C+D9XTTfC9pM0rGixTndTrdX6KOZppKabQeThZEPQ0
         WbvErz8+L9sSBQfsvVQhsYzHw/ZTrlPzlk5tdzxqN2MFo8mIKo7rw3hRC7M/SeGI6N7Y
         5V+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRBsT9pLaqIx5WGsQc4Z+o2AjhYOFRNgNZyZnlnFHHp7XAQZ3CkQS8yV7/RCOkt/SaaHC1xvHQmRE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzNf4RIgYHRuLBmPLJVN6CE1jQZnqqmDEy2mrLBPiF5t3/B/8Lb
	0b4bj1B3YTq1UCD3+OsCukYL0RpWiRTxMFvmafcXqrMoutZXN6U4pYzXcd6dchh5Y26w/i2F9dz
	jZdGxZA==
X-Google-Smtp-Source: AGHT+IGywTlpl0dHWnufpJSJlj4XpNlHL6UkXqc9RZbcriTQyKRR+zlmrTb17NJPljis76xDw4xc0g5PFgU=
X-Received: from pjbsr4.prod.google.com ([2002:a17:90b:4e84:b0:313:2ad9:17ec])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2dd2:b0:312:f88d:25f9
 with SMTP id 98e67ed59e1d1-313f1c7dacfmr2043479a91.7.1749853760694; Fri, 13
 Jun 2025 15:29:20 -0700 (PDT)
Date: Fri, 13 Jun 2025 15:29:19 -0700
In-Reply-To: <20250612-70c2e573983d05c4fbc41102@orel>
Mime-Version: 1.0
References: <50989f0a02790f9d7dc804c2ade6387c4e7fbdbc.1749634392.git.zhouquan@iscas.ac.cn>
 <20250611-352bef23df9a4ec55fe5cb68@orel> <aEmsIOuz3bLwjBW_@google.com> <20250612-70c2e573983d05c4fbc41102@orel>
Message-ID: <aEymPwNM59fafP04@google.com>
Subject: Re: [PATCH] RISC-V: KVM: Avoid re-acquiring memslot in kvm_riscv_gstage_map()
From: Sean Christopherson <seanjc@google.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: zhouquan@iscas.ac.cn, anup@brainfault.org, atishp@atishpatra.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_152922_078240_289AF3F3 
X-CRM114-Status: GOOD (  12.03  )
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

On Thu, Jun 12, 2025, Andrew Jones wrote:
> On Wed, Jun 11, 2025 at 09:17:36AM -0700, Sean Christopherson wrote:
> > Looks like y'all also have a bug where an -EEXIST will be returned to userspace,
> > and will generate what's probably a spurious kvm_err() message.
> 
> On 32-bit riscv, due to losing the upper bits of the physical address? Or
> is there yet another thing to fix?

Another bug, I think.  gstage_set_pte() returns -EEXIST if a PTE exists, and I
_assume_ that's supposed to be benign?  But this code returns it blindly:

	if (writable) {
		mark_page_dirty(kvm, gfn);
		ret = gstage_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
				      vma_pagesize, false, true);
	} else {
		ret = gstage_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
				      vma_pagesize, true, true);
	}

	if (ret)
		kvm_err("Failed to map in G-stage\n");

out_unlock:
	kvm_release_faultin_page(kvm, page, ret && ret != -EEXIST, writable);
	spin_unlock(&kvm->mmu_lock);
	return ret;

and gstage_page_fault() forwards negative return codes:

	ret = kvm_riscv_gstage_map(vcpu, memslot, fault_addr, hva,
		(trap->scause == EXC_STORE_GUEST_PAGE_FAULT) ? true : false);
	if (ret < 0)
		return ret;

and so eventually -EEXIST will propagate to userspace.

I haven't looked too closely at the RISC-V MMU, but I would be surprised if
encountering what ends up being a spurious fault is completely impossible.

> The diff looks good to me, should I test and post it for you?

If you test it, I'll happily write changelogs and post patches.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
