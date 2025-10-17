Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA2ACCD195
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 16:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uKxXQLa9R8i4Bh1s5m7RK0ojz6Guj7CNcloDR8FuDyc=; b=RObq/DYTNUEZwh
	hMjIwJ+BW/+e+x6Nq3t2J965CWivkJOkfD5XWUR26PaQNFnE5UIKrInr9vKZLe09iXx/Oc8uoErW9
	GfMVHPMPV79p5c5DswHPOqJyPpoWXHisqevqVhXE3Hsqy6SnX6brxPEyzC/sNB/nvpCFMzU2ZjokM
	bnoxCSJaqlIUZ1sTyAvT77Ed5UPITwb3phXnLA4xSUJK3Zv8dLqws+n9HUr40hyk5pA4Dw6EvT2yf
	Uh39hv7Yh4VGw+oFqQn69YrGpvC+/bB5Yuvw0ptm9ErlTCQQM7d/tZbiwD94xElN17D9rua3N33sh
	RcMKJogQsZBh8xrGi1/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nBj-00000008Pqa-2jtE;
	Fri, 17 Oct 2025 16:20:19 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nBh-00000008Pph-12vs
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 16:20:18 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-93e847a443fso21864439f.0
        for <kvm-riscv@lists.infradead.org>; Fri, 17 Oct 2025 09:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760718016; x=1761322816; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GLnYMiGE1i6wdt2kWbvCEK+VTfi2UEFuvCxtEUGWUPM=;
        b=PvoA/RzcF1MiYd1WPC7JiWkbl+ao/1n+Ub+HD9FMLiGdq72JtPp0VH5dSjwZ/4LXa7
         5NdJhiAHWCu0n3qDgkd1wIYV4oJSKs/s8O6ZGSWEDc+2KA/rCyGhVhUZbL+BttEGOdP0
         6C5JULeuhsAF10/+pqWSv/Rzf1P5wkqS2355uqyqbOibbC/9dhdv8DRRITJqzZuRI3GG
         Z9v7H4xYrNuFr6rkoN4uDZTAA0zVPpim29/XOINDe4FkVoi6oHSXdt+Gw4aEmM98LJnK
         v5uo0722G/zNrBfjf0x7PDE1NVNgCJiJg1w9KA1ANH9ixbhZ6IB4r0p+Iq2RKBu6An6V
         QVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760718016; x=1761322816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLnYMiGE1i6wdt2kWbvCEK+VTfi2UEFuvCxtEUGWUPM=;
        b=X6kg8sHSSj58iZXjq1Kbq3iF+SEW7JyxrZeDMzqvs1BuUR7lZh8UhbiX0VzF0a//QX
         pCPNFZ5Cfpk2kPk4+9tUUxTXXk6HwdgNMSkS49f5Qj/BuHHE4j7BZ0yEHcq/KnNphkOD
         LFL/tSzN/vyvjMMIT5q3RAoU0k2Iv2bOut0r250kKJN7FjVA7THJSDYESB9s+UlFNqJm
         H3rsxAkrlLctJDO2EGPqyUBpieNX9309rlLIsyCFKjl2MZMCKohj/U1DUfp2RQ2uZwO5
         6trP5IXinIFeKyBn1lSpVqKMgB2N24jz3vReSt8/+LENd2JRi4Az0skpXScr0dc4ApaB
         Ntvg==
X-Forwarded-Encrypted: i=1; AJvYcCUiwo8fjV+hRdPqhmezo1JfVlOFHHzy1bwSQtKo07VvbmDes+mjNpTJ1ra3r3VQQGrRj3olM/s6l6U=@lists.infradead.org
X-Gm-Message-State: AOJu0YyOWn39nEIvTKuqa86uOyK8BGCDHXSNoqiS2pE1F1Ff1U6etVsE
	ZeHb+6pgemS3HXzcRL5cH92RDTXUZlE3SRkNV7sEkrC+KGGvRjSAVI+xhJQa5lg99cy8qasOB99
	4g5FV21s=
X-Gm-Gg: ASbGncshKuXgmAAXNc2FKqXIBQqyGyyu5rk3/LStNQTakjjAGS68JbzC9wi38x5uZlC
	R0zebvOUtXkW6D0zyD4nVy6CkR+BUlGX3UlOsDNpy+OPkqAqNWpiW+H/UfrpsGdm96n9C7TV1D6
	ktC0Pbz5PSDSbhux03DmrD6CZSii0+2zEAxfrhiHY6IzL1tpNyOJWA3MwKBYtLLs81rntEDhUCJ
	xpdRCfik2FGMoD0Rc04yLV+q0qeA1TvXF39PZe8FlxVALik66eiuL4eBVaIPgPs+4ZNvPgiDeqf
	juHAQ41QxYxiOQ7rLRTSAtvikxSTttP+KaW0OW5c9FQoWVXAedcnJJNhRKZHAn9ygX75n7NLlZw
	SWPOFQEu/5yA/72lc43B0gtVBsyk0jUtfoiSJtzIG45QlMgh+HpqU/KZco/lzVzUDmprFq1GYFG
	xPZdn4j9QLBHoH
X-Google-Smtp-Source: AGHT+IGx0p/Murx0/nwCjsggRoQIsfWi9xXyoIzQDYLWIYmSzYKlABJ6zEfQQ5rWYKVGG7cg4jaAGA==
X-Received: by 2002:a05:6e02:1a66:b0:425:951f:52fa with SMTP id e9e14a558f8ab-430c5275304mr65365645ab.14.1760718015987;
        Fri, 17 Oct 2025 09:20:15 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a95fecfcsm22608173.13.2025.10.17.09.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 09:20:15 -0700 (PDT)
Date: Fri, 17 Oct 2025 11:20:14 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 3/4] RISC-V: KVM: Add SBI MPXY extension support for Guest
Message-ID: <20251017-cfdb6c77b74b87b784a3bd35@orel>
References: <20251017155925.361560-1-apatel@ventanamicro.com>
 <20251017155925.361560-4-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251017155925.361560-4-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_092017_287642_BAE6A7D6 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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

On Fri, Oct 17, 2025 at 09:29:24PM +0530, Anup Patel wrote:
> The SBI MPXY extension is a platform-level functionality so KVM only
> needs to forward SBI MPXY calls to KVM user-space.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h | 1 +
>  arch/riscv/include/uapi/asm/kvm.h     | 1 +
>  arch/riscv/kvm/vcpu_sbi.c             | 4 ++++
>  arch/riscv/kvm/vcpu_sbi_forward.c     | 7 +++++++
>  4 files changed, 13 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
