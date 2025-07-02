Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88196C77B7C
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 15:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2+FCnQolS33t4vpP8KlEM/6HPXTbh5pwdY9if3fMUfs=; b=kDcbe0FoZV/y04
	SYIAQl4fZz8ZKzzGQ9qeWpXGkaw/4ssBTsO2EX1yc7HaKA6Swc9QJPewJLyZmynfncp587m/GqDoo
	WrW5jHVU/yQ6mfT8lowzwOrsecIiJLVmo/xJnUUCxhw3GuD7CWIavUMTDurFfYoXu1icj0EDKSzpf
	NA5X9ki/ZBW/joBHrOjjerj5+VCkh5PvC8JIGqhh+BUamXYS21/K54IudoyXe73E/TMuQ3nSltFbP
	SRKVeO6dQoUbWz6j/kGVCVVEbRijvnEHi1OUz4Yf6A70U7Us5u10cLp0H2mGvr+rMqqDcZ828f/zR
	QFJ4riX11CprHDby39OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWz7Y-00000008k52-3WVk;
	Wed, 02 Jul 2025 15:11:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyA3-00000008aS6-120R
	for kvm-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 14:10:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751465406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TgZwYQY/6//7Y1IiL72sIvHhk7c1rsqVRlKePVxyg/g=;
	b=XId41UTgFG2m8aM2hiqC98De0w8e7iaGitmLuKdhhI5xeJifYi7cgG3jv8+KJAH5rDMnSh
	7zkhIynV0xYrcAe4DTgpQ/M8y5cgdxWM8n9VxO7QsFaWZNUqSnaR9QarnJF3642c/hSruG
	5bCEadorrkK0oWtTlOQ3R9GzT59I090=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-BxGtjZQCNlKdzUEZY6lngg-1; Wed, 02 Jul 2025 10:10:05 -0400
X-MC-Unique: BxGtjZQCNlKdzUEZY6lngg-1
X-Mimecast-MFC-AGG-ID: BxGtjZQCNlKdzUEZY6lngg_1751465404
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450d244bfabso40296515e9.0
        for <kvm-riscv@lists.infradead.org>; Wed, 02 Jul 2025 07:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751465404; x=1752070204;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TgZwYQY/6//7Y1IiL72sIvHhk7c1rsqVRlKePVxyg/g=;
        b=hH4C9woxcNYVYqq6Bi+LCr0h/4r8v9Qd+GThgH8j1seldIzb2NYEr17wIv6C2NqGQK
         xlOKgpiSu6juqXEffvChPsvovKFzziAJDzl6VqjaPpNvyEr73FoTBPt9La5TshvXOiES
         0qa2BiVrcPJYsWYPCt9kV56nbwedTsZz6QXwNkQ3KoL0RKRXX0C23JPgYGXKSMoLa7+5
         ytpcqLMr3CgZMRCvtUfb4AtaDYzBxLQ+o98WKVBL/BbpyY26LBvmd99EdNWvXejXosfI
         Fb1hxS1ONKsnobLUvD7tEX077se87IgE16UP7DOnGFDRZU2KzwY/KmeH9lpRLfJCC24b
         ciUA==
X-Forwarded-Encrypted: i=1; AJvYcCUDSaDUagtlPHBjN6yLireqFbdA4eS6V2Ytt230XxzCHOqpRDA7AecTfJuqHwO0mvtzBrJoM/6zvig=@lists.infradead.org
X-Gm-Message-State: AOJu0YwqxdYnxquQFKSnkGE9NeaS8jK7DSdhTxQLWnp9QSUZzrC3TXVM
	ZgG1abMA0uksoudrLjGMc4NA0WTDxeVBUxnk/m9azx7e2MFliJ9cPZsw4wT//QRjEXLXANmBE2M
	//PUBJAEazrQ8/bhYPFHB5Yapdoc3T0KbLqezdpydv98+6CfyzL+HT8AYV2/iFG2ZVdU=
X-Gm-Gg: ASbGncsZhuSYddVjsq1nL+3RDDcj9RrhFOjWWRS3vNVjsX/nwDmmlX1AjdghfbkJ3ww
	pJL3nwGkw4/RWQnAjA9TuFz1/BEh8DM7sXbKPjR0/fm+VFZEFobgPAy6vS3JbUHkyYNEiD4rAgi
	FqMcJF33c+qlWU03OSP4cQxOhssyWedrgYgVG1pUkN16gBg7+EAyRPO3xg+UzkjFYyqewuzZlWw
	l/bwmzybvZS3BJcEo4ckwlWt0sRY7XtXWi7M/DG7Cv4bYUxu5AYJ4oWSM2TfhdHZaZhZEzD0kyF
	yYCn4S4qFSnCFUykjB+mwJWKsgv1jX3XNTSQKubPLHMjxqZ/uuTb/RuzE0WipQ==
X-Received: by 2002:a05:6000:18a5:b0:3a3:5f36:33ee with SMTP id ffacd0b85a97d-3b20048e6acmr2349179f8f.32.1751465402222;
        Wed, 02 Jul 2025 07:10:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTHkYd/ujfN4fgDDxoyAu+QvDaaEzPHy6fqG+fLvYE5NiiLRk5DOmUub4YoMfZz682a8//Nw==
X-Received: by 2002:a05:6000:18a5:b0:3a3:5f36:33ee with SMTP id ffacd0b85a97d-3b20048e6acmr2349116f8f.32.1751465401643;
        Wed, 02 Jul 2025 07:10:01 -0700 (PDT)
Received: from [192.168.0.6] (ltea-047-064-114-041.pools.arcor-ip.net. [47.64.114.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c57d7sm240986715e9.40.2025.07.02.07.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 07:10:01 -0700 (PDT)
Message-ID: <627b4dd5-b08c-41b4-a3cb-99d522fc2063@redhat.com>
Date: Wed, 2 Jul 2025 16:09:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 2/2] scripts: Add 'test_args' test
 definition parameter
To: Alexandru Elisei <alexandru.elisei@arm.com>, kvm@vger.kernel.org,
 andrew.jones@linux.dev, lvivier@redhat.com, frankja@linux.ibm.com,
 imbrenda@linux.ibm.com, nrb@linux.ibm.com, pbonzini@redhat.com,
 eric.auger@redhat.com, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 david@redhat.com, linux-s390@vger.kernel.org
Cc: Shaoqin Huang <shahuang@redhat.com>
References: <20250625154354.27015-1-alexandru.elisei@arm.com>
 <20250625154354.27015-3-alexandru.elisei@arm.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250625154354.27015-3-alexandru.elisei@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ffVJUy4U8h28Uo_ogBu1B-TznZG0VYTv4h6abIm1AY8_1751465404
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_071007_370338_3ED4E0B6 
X-CRM114-Status: GOOD (  13.57  )
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

On 25/06/2025 17.43, Alexandru Elisei wrote:
> kvm-unit-tests, on arm and arm64, is getting ready to support running all
> the test automatically under kvmtool. Even though kvmtool has a different
> syntax for configuring and running a virtual machine, kvmtool and qemu have
> in common the test arguments that are passed to the main() function.
> 
> Add a new test definition parameter, 'test_args', that contains only the
> VMM-independent arguments that are passed to the main() function, with the
> intention for the parameter to be used by both qemu and kvmtool, when
> support for kvmtool is added.
> 
> Suggested-by: Andrew Jones <andrew.jones@linux.dev>
> Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>   arm/unittests.cfg     | 94 ++++++++++++++++++++++++++-----------------
>   docs/unittests.txt    | 17 ++++++--
>   powerpc/unittests.cfg | 19 +++++----
>   riscv/unittests.cfg   |  2 +-
>   s390x/unittests.cfg   | 13 +++---
>   scripts/common.bash   |  8 +++-
>   scripts/runtime.bash  | 18 ++++++---
>   x86/unittests.cfg     | 92 ++++++++++++++++++++++++++----------------
>   8 files changed, 164 insertions(+), 99 deletions(-)

FWIW,
Acked-by: Thomas Huth <thuth@redhat.com>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
