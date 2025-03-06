Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B91C282D1
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Mar 2025 09:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5KL75w9lfEjeuuVfzqchrbfnBTtVSNxXxwFx4OmdE1s=; b=dyXa/o6t6czzYr
	mXjO9qEj4Nioc3Vdpe6BpQoBzfBp7cHoHe9hwGvith5J86G9YEyO6cy7GkrUxSSYyboy+oyFn98dL
	zmMHxriVQ7/RHxWKCqodVk3WhdL4b5t1IHnP4cK2Nxf+cFYlazP8b/WKO2hGPRETqMZiiL3CdH22d
	eDqnQipohjAtY6H/KjktZTV7faEuxeLUuyzewg+SV07DaHl/5MYftJuuYxIQGu8Wvf+pKkdlN0lIR
	RBFHI2ajwgk45nhpwllTyBOedAFlcH8TKQJ/sfu2s6n5dkAJ1QxDG1hRA1CXBgLeiW5Vz5+QUWc6U
	YSx4Dn+DAOKP9cKlCx8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7Jd-0000000ASGn-3vli;
	Thu, 06 Mar 2025 09:14:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq78H-0000000AQVj-0BxS
	for kvm-riscv@bombadil.infradead.org;
	Thu, 06 Mar 2025 09:03:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pY2indv9DvyBZQJoUjIBXHffPxVcc0dm+eOOwrLDR6k=; b=FJ3VtoUpqLGD4G3srK5iCwmAIK
	qjTx9eYiMEQytMRPvVdfssrjm9+qmsGir5Z/uKVKHBjt2lCrDCyNw6x1HbxX6p/LTL7qGyv7eQmUH
	PY+/yu19Pg8JU26IQU96+lgvD1cIpMRVIgOQlAI/OQ96KMEy6tFZ67imM38lMG5bPJ8urPWgniiMV
	xByu8ThMZcsbP1IY4nug3Ur6qSPPCgA4nEpJnriq1cv6MWm02zaCCTWdQKLrEOVXWi81GJvY8acXk
	aj1u89HnsQs5nxX0VkAAqqlnKevrTKFoSEe6LIh+JEPoiiRtymTemJ1AkvifYvO+kRjo5PUiPHtbl
	++MXBVoQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq78D-00000000ytF-0cq5
	for kvm-riscv@lists.infradead.org;
	Thu, 06 Mar 2025 09:03:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741251781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pY2indv9DvyBZQJoUjIBXHffPxVcc0dm+eOOwrLDR6k=;
	b=bxv+bTJ1YDh/3QbjiylaaQ61oZaJiIrLDd7GyVmrBFGsrzpO9WwN3jXJyt+Oyk46NLgeJk
	RqNYMvDnfDVfelCvWug1ey7DqfizW1yNIbWA1Evnedc4/dyfSLRJcxpis0txSY9RbVcpUg
	BwmdY1aXvi+qkWoifND/8D/fn9/rmcw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741251781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pY2indv9DvyBZQJoUjIBXHffPxVcc0dm+eOOwrLDR6k=;
	b=bxv+bTJ1YDh/3QbjiylaaQ61oZaJiIrLDd7GyVmrBFGsrzpO9WwN3jXJyt+Oyk46NLgeJk
	RqNYMvDnfDVfelCvWug1ey7DqfizW1yNIbWA1Evnedc4/dyfSLRJcxpis0txSY9RbVcpUg
	BwmdY1aXvi+qkWoifND/8D/fn9/rmcw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-02NMClV1PXKncCdCjWTx8Q-1; Thu, 06 Mar 2025 04:01:01 -0500
X-MC-Unique: 02NMClV1PXKncCdCjWTx8Q-1
X-Mimecast-MFC-AGG-ID: 02NMClV1PXKncCdCjWTx8Q_1741251659
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43bc5a18c52so1496155e9.3
        for <kvm-riscv@lists.infradead.org>; Thu, 06 Mar 2025 01:01:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741251659; x=1741856459;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pY2indv9DvyBZQJoUjIBXHffPxVcc0dm+eOOwrLDR6k=;
        b=poCUeQm8Mmokpn+YS6YdJZlS1KbHCsHaSst2ivs5BBoTtjjohc86gLRPtbxQkY0LS1
         o5hJ0xc6OArtwXCicXnBW8gg5PBW3ZCcRaoSDnONLRZaiLl//wCrFicctjsgcF/OKVN/
         wddnM7ye0HxCpte8hfHIj2LjT+ueJ1oYbrx0b0YW16bKlbniwEkCPvWzNZQjpi7GSsNE
         obDBeSUGBJRWFQVRhfZjQ4TXkOiYOo+CkExtOZeRqTYZ9+AE5h3+Xxidc35F0q6mHGiF
         1TrZBdO6AxY0jE/+CK2PahSLYo+KzanRjcNeQE0WlTj5PkZiaPlVEUeUrNlQLJvom5H3
         v56g==
X-Forwarded-Encrypted: i=1; AJvYcCUuB0hiu/c7ZDjb7H0VaktMQXcZ5/rSK09isvTKXcjM6lTibaTM6Eds5nSJsX49Fc0qwswIlwzfMhI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr9hM6B8vTNBMWu3Mj0Bf7lZqMKhNYG0SyAu+qLZk1njH2MYQ0
	YCXM4PYHVL9V9aQu1ppd0Wt6GHiHSHFoDJdSuvatyuL63Sp/CsuJGn9i5v6/gSL2eWITdTL/zYn
	G5RtwHwxMBmbFNj7WyXGF9foa+44DOC/iyyPdVb1pO3z8xxbAJu+GtOLkV7iAV0m44FzP0Kw=
X-Gm-Gg: ASbGnct9eKihRjX60WPQy5uquOF29TSCzFDNie+Cw5XpjHhIqZ980UigWLtEgzXMfpm
	bXkRkoIsrW7+dNGhSOhyLclaF3so5in6Feu1TMllcylbitnfbwTSM8EjXYVKDpaIo0EbsAIhVgG
	Oq6yHFxyTbQZoR/Oo9JWlRj2zy9sxKB6aqW2C7yBjhe8reJzjSL/Zl6hN2SpPW9kbr7lTtzkpau
	o6sLu5mI/GAd0tVyVhVjITHPcttVOAVVZo0DT7KquSQbypzLuekPSVYoF3l9LApOppZPxULuObP
	vPUyS11kciGCUhpQDNO6IbLT86gMmFGkHjDCtY8qikVUaew=
X-Received: by 2002:a05:600c:35d4:b0:439:9f42:c137 with SMTP id 5b1f17b1804b1-43bd298f9fbmr59118315e9.11.1741251659393;
        Thu, 06 Mar 2025 01:00:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2NgeNdUnGXbD+op2sXJsB/SN3xlXNlbIFOWQaCFoi1UgYgSk1r/tZKHyzVnT9tI/XhwhMWA==
X-Received: by 2002:a05:600c:35d4:b0:439:9f42:c137 with SMTP id 5b1f17b1804b1-43bd298f9fbmr59118055e9.11.1741251659046;
        Thu, 06 Mar 2025 01:00:59 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-231.web.vodafone.de. [109.42.51.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd948cd0sm12787105e9.38.2025.03.06.01.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 01:00:58 -0800 (PST)
Message-ID: <a10378eb-4bff-488c-86f7-b4fec20feb6a@redhat.com>
Date: Thu, 6 Mar 2025 10:00:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC kvm-unit-tests PATCH] lib: Use __ASSEMBLER__ instead of
 __ASSEMBLY__
To: Sean Christopherson <seanjc@google.com>,
 Andrew Jones <andrew.jones@linux.dev>, Laurent Vivier <lvivier@redhat.com>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org
References: <20250222014526.2302653-1-seanjc@google.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250222014526.2302653-1-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xKqXpGaIYnQPimDv21Cqr4rEGldQ1FB20nQ2HNepG0E_1741251659
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_090305_383678_DBFD14C7 
X-CRM114-Status: GOOD (  12.40  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On 22/02/2025 02.45, Sean Christopherson wrote:
> Convert all non-x86 #ifdefs from __ASSEMBLY__ to __ASSEMBLER__, and remove
> all manual __ASSEMBLY__ #defines.  __ASSEMBLY_ was inherited blindly from
> the Linux kernel, and must be manually defined, e.g. through build rules
> or with the aforementioned explicit #defines in assembly code.
> 
> __ASSEMBLER__ on the other hand is automatically defined by the compiler
> when preprocessing assembly, i.e. doesn't require manually #defines for
> the code to function correctly.
> 
> Ignore x86, as x86 doesn't actually rely on __ASSEMBLY__ at the moment,
> and is undergoing a parallel cleanup.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
> 
> Completely untested.  This is essentially a "rage" patch after spending
> way, way too much time trying to understand why I couldn't include some
> __ASSEMBLY__ protected headers in x86 assembly files.

Thanks, applied (after fixing the spot that Andrew mentioned and another one 
that has been merged in between)!

BTW, do you happen to know why the kernel uses __ASSEMBLY__ and not 
__ASSEMBLER__? Just grown historically, or is there a real reason?

  Thomas


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
