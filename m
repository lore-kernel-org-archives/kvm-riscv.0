Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9456C677C4
	for <kvm-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 15:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yDeVzkPY+uvwJBBkGGShQOCRE7+EhOz+gchbIlKZAyk=; b=gbzKW3WAwNYZMi
	Wt910TjeA9rofnudLFjgU0+ctUbGzeH0iRZ9dGGAC28m3QLMeh8gB1pUcpdRS2Id1CeL5WlX5Wtf/
	m3MJSfGDhFFU2auMCWMkb8LxHdRAHOngsfx+VbP01cuK7aPvTYqHM1IPWUb0vf0qyGbQwRbqnGZyY
	l0bhm73aPfhHX0UeQ1nCH0kz0s8z2sebR4rx9Fp5iUKde5JOHUl5Ukl+rNofyek7IXda4SBrVds1n
	IMONVlqhQ8aILGkyli8Cgqr5Ji79YX+05KcGOOMgSCi9xGaZhd2uJUhiGB6ZWgIo5nHQbDnb9/X81
	433L1Bu6JBV0F1DYcgNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNnD-0000000AV1I-2JA5;
	Wed, 11 Jun 2025 15:55:11 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJdg-00000009kHB-1c8w
	for kvm-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 11:29:05 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a36748920cso5725697f8f.2
        for <kvm-riscv@lists.infradead.org>; Wed, 11 Jun 2025 04:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749641342; x=1750246142; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a5eBwBbTQUmE/jg9qxOQzcw7gsljfjr3T8EkpVA+lR8=;
        b=YZz9CTkYcCZ3oFINg9muqBHSCpW3sETClBxSTgu2zCYfHOahTDP1mpA/0z03Fw7LJQ
         4RJ/eLPW5WyLjvnDAeV29xfcSpVmoXK3pYvKZ2TcthDUZ0NQLvMXfQWYZVyjG7vBNIoQ
         6enV5jP/RNYG15xcNv4psogeP0XU/LbhhIXuNjPFdLy5foLgQUCX3qksKnaGAOs8UYZP
         vZPBazSP4AYrfQU4QQ7+vmMK4PkkiUKC0GBhNXtPkr/85Ihv4+P9F5n2avWQiqTUkP2q
         MXvlf+TrdhMdnJlCFGldC+BliceOfbPsBQau5Uc602hzACp4reaxBeDcdL5cdULv5/yv
         Pyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749641342; x=1750246142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5eBwBbTQUmE/jg9qxOQzcw7gsljfjr3T8EkpVA+lR8=;
        b=q7+dm2tk0CIpL/JR23bGmgWY0FhV6VyONAMQLeqcMh4gMFybZLKudBsaGvdDoRBQCy
         HDEJ05nfsxhEE1VbC0TBu2L1LoL3I00rP4QpElz1DoOQkhQ6tOqBIAklPIu5wpzCA2SM
         JQJbYLh26C7glEMrTTqI8BG+YIQ8DRRnZlp2V1l5g+k4hyh4NQsvTFLm8fxnYQpQRcE2
         oC9XjbYc7oY5nl/18cG/djrPLKqOExa3Lt/cG3yO4AX8vqUp5TP4PP4W0z1qqjnb1M4C
         L43Hn+217ME32YLNemh5QGmyIl7aJ55z4SO9WIH09zG+fhJbtLX/1GeZX1E76pX3kB3f
         KGxA==
X-Forwarded-Encrypted: i=1; AJvYcCVZzUhOQG3Gs+pIO/67EvXkDTJghoz24A26AqmKAjA4tXIcUzv29Kowl/WBjMHdtszDf/Dz8bjH2+4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwaKGnNj9OeGgUwt0gHHecqKqun8j/gMDijqUnJnyl6ZuyZEJlr
	g4YQ/g//8ssyHPwxhqf3uzTxG4B+M4g2KioOIRmHxaUOrK8gFwrYsvWGssze867jZYo=
X-Gm-Gg: ASbGncuGTvRTR+FHgnWeW7EGJ6bEFotD/3Gjni4mLPyIHSxS+8jIWgG9xakDtirkkJy
	8FzOEy3Zt/PQMeukaxlElTYPH7DvTvdU0nVxVD5xFkvYwi01Mq1e9IvN+xBoa0KpCDAdSos4mlT
	XJl0C8zl9G+h1KdvQhIAtSfzEVjBGgCRYh2E/eM5/LzgCJuSGETq+lznhWSOnf1XhiRl+NWTEDb
	uFyIYv9/J+xx7EQWPUWH6fMhctvU+HAK0V6aP8AGRPxU7Rz9FVjqiurk8nKDAsX+yRkAsebB/E6
	xwpMrvloY9Jb/Pk5QsQi+P610/d4ZD0AMT1DXdsPw6AYIcZ/Fg==
X-Google-Smtp-Source: AGHT+IGR2AIUE7a4nEZNX6K/UcpKOCr7ODBk7la16aB9kHn6bvTqIQ8QJX5Tm6kGkYsyX0BXvJw49w==
X-Received: by 2002:a5d:64e2:0:b0:3a0:b940:d479 with SMTP id ffacd0b85a97d-3a558af780fmr2434572f8f.53.1749641342318;
        Wed, 11 Jun 2025 04:29:02 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323c08fasm14761939f8f.44.2025.06.11.04.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 04:29:01 -0700 (PDT)
Date: Wed, 11 Jun 2025 13:29:01 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: KVM: Avoid re-acquiring memslot in
 kvm_riscv_gstage_map()
Message-ID: <20250611-352bef23df9a4ec55fe5cb68@orel>
References: <50989f0a02790f9d7dc804c2ade6387c4e7fbdbc.1749634392.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <50989f0a02790f9d7dc804c2ade6387c4e7fbdbc.1749634392.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_042904_419276_3411404C 
X-CRM114-Status: GOOD (  19.34  )
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

On Wed, Jun 11, 2025 at 05:51:40PM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> The caller has already passed in the memslot, and there are
> two instances `{kvm_faultin_pfn/mark_page_dirty}` of retrieving
> the memslot again in `kvm_riscv_gstage_map`, we can replace them
> with `{__kvm_faultin_pfn/mark_page_dirty_in_slot}`.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/kvm/mmu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 1087ea74567b..f9059dac3ba3 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -648,7 +648,8 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  		return -EFAULT;
>  	}
>  
> -	hfn = kvm_faultin_pfn(vcpu, gfn, is_write, &writable, &page);
> +	hfn = __kvm_faultin_pfn(memslot, gfn, is_write ? FOLL_WRITE : 0,
> +				&writable, &page);

I think introducing another function with the following diff would be
better than duplicating the is_write to foll translation.

Thanks,
drew

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 291d49b9bf05..6c80ad5c7e89 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1288,12 +1288,20 @@ kvm_pfn_t __kvm_faultin_pfn(const struct kvm_memory_slot *slot, gfn_t gfn,
                            unsigned int foll, bool *writable,
                            struct page **refcounted_page);

+static inline kvm_pfn_t kvm_faultin_pfn_in_slot(const struct kvm_memory_slot *slot,
+                                               gfn_t gfn,
+                                               unsigned int foll, bool *writable,
+                                               struct page **refcounted_page)
+{
+       return __kvm_faultin_pfn(slot, gfn, write ? FOLL_WRITE : 0, writable, refcounted_page);
+}
+
 static inline kvm_pfn_t kvm_faultin_pfn(struct kvm_vcpu *vcpu, gfn_t gfn,
                                        bool write, bool *writable,
                                        struct page **refcounted_page)
 {
-       return __kvm_faultin_pfn(kvm_vcpu_gfn_to_memslot(vcpu, gfn), gfn,
-                                write ? FOLL_WRITE : 0, writable, refcounted_page);
+       return kvm_faultin_pfn_in_slot(kvm_vcpu_gfn_to_memslot(vcpu, gfn), gfn,
+                                      write, writable, refcounted_page);
 }

>  	if (hfn == KVM_PFN_ERR_HWPOISON) {
>  		send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
>  				vma_pageshift, current);
> @@ -670,7 +671,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  		goto out_unlock;
>  
>  	if (writable) {
> -		mark_page_dirty(kvm, gfn);
> +		mark_page_dirty_in_slot(kvm, memslot, gfn);
>  		ret = gstage_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
>  				      vma_pagesize, false, true);
>  	} else {
> -- 
> 2.34.1
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
