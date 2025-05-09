Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73ACC3ABC3
	for <kvm-riscv@archiver.kernel.org>; Fri,  9 May 2025 12:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Efj7le50C1qgKsXZO/E9sbRLfgqyqo696FZoBzwmuU=; b=x2wJLD8GyicIxb
	slOzETJ+ZAHsK5P0WxVbOxJdr+SzFRK1um1tWV0Rp7heCH5Lc7crmYKZBkrnxEhwfc5slGcWrljl9
	TTY7vYY4an1jDuUCi1YVX5Mm3frF51SXjHuvAoTnoVXfNmSNZz3te3vHeWl/xVJU+9xF4N/bLdfzd
	KeVoiiT9mc98WlnTFLyAtRXZGdkj0tILRmANcCImNGVVSOBQxVU0ZGk/Pv+C+d0mlwFiYdP8X/8St
	o3QCyHoGUetCxsbzFW1z4eMDe6D5+QzLv4+afFLrgKKQFUiPua+IMIXTE4btXcq3cm1D6Ha1EaIzH
	Li+54ROtEOkIBGRqDmVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMr9-00000003ama-2Lfn;
	Fri, 09 May 2025 12:29:35 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLvT-00000003RBJ-37Zy
	for kvm-riscv@lists.infradead.org;
	Fri, 09 May 2025 11:30:01 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a0b7fbdde7so1780976f8f.2
        for <kvm-riscv@lists.infradead.org>; Fri, 09 May 2025 04:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746790198; x=1747394998; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PS161WiIseqQMvNduUZogtk3N3mmBOCWz6m7XRDgGoE=;
        b=e/03okHfapOxFA25OL1YX/B1rxN9Yz2EELJQdYRI599sjczwJY96v56RGiY2Gf/iU8
         vUZGn0qDW9bYn1VGFDzwTsGGe+T8vWN5RR8FwokcOHXr2VRWrIZTVobUm4l97bYUqtrV
         5LH0q5YCHj2VY0t802WW0KY85xl0OiZqFrd87U0dMQ0zxOhBoTI/cTKos9RCwLIwypss
         h7Y0whwP6W7+U/nA0aXVxvI6hDUbMWP9oXzU6pnk9ZXHigZBO6Oo+v9lyofEtMJe6gFG
         H4o2gEsXjSOVC6fOhdSzlTkJgpXWT5lSRUsnAvxqgc6n1fr0JfVmG5uYYfRueKQskvU8
         GPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746790198; x=1747394998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PS161WiIseqQMvNduUZogtk3N3mmBOCWz6m7XRDgGoE=;
        b=q7pO8J738D/Fa7TlQuU1Hx4WKmWdvCoeFHEL1lrADjz4Le7ckOZOdjOczoGkfC3CiR
         piqwOAuRYiocVVZl+k0C4t+CDZ/JayeCN6f804+E4jF+/SEF4okdg5mjbBkfBCquLQaW
         R4dBRCCgfQH4onuR5RJqnQYtX7agSxDVW1RzzTIBRaHLZX2tyRa2ftfpJjZ6du/3dGoe
         booYe3xuuBel26uR/8MbTKrlnWlXEMND6w2MEyT20CbmJIKiW0vRJdi62Lq670s+ZHu3
         oP1mLa88ZMBrRki/W+hDSs/eS0L9ixjYHPhP67+0PJ2emjTeR2xzBo3FKdZC2ia9cmfp
         dWYw==
X-Forwarded-Encrypted: i=1; AJvYcCW3x+k/NXxtmm4WL5m9ZbGCqYTIJhpivQtGGG6O3w18jPqOJfjYBnnuLo2kjvUMMAaWN7aee8VN/AI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8KwI8AIYX/yrcQnNxfM+P9q8Qw/Zm3VbY2jbKjPlQHdNQQTFk
	czOcfIIPB0R0vKvDEJZJjaUP6pqiGAR3ywwYvQa3RmQP7Omx7ETKt5TxURvluT4=
X-Gm-Gg: ASbGncsbOTsLMiqTVT7tG17eqmRglJB49SyNBbeVyXQo5Vjze7543MZvSeqEhSgw2zM
	SQ45KObovP6TQDfCDQ/j4qL1Kul8k4QsvnM5ugfcj1tjbGmruiK8vfQdNTVK4cx3qcj1ENUbduZ
	IoqaqCzBQXBd8QV42CsGVrbmHzoHmqItbFXQfnIhrrO3akhvmU+rz3FBVfLcoXFF8p7bNslCib7
	WaNNg8J6b08tHq4xLz8h8R4jCwpxbCigO9WlUoSLuTsEbaryKobbsgL6raTNV1b4D3vnQGQkbUI
	rHgp2H4mcLz5oPeBohVAmC7lHYnQ
X-Google-Smtp-Source: AGHT+IFyD+sjIl6oyk+GUqpe3q06X8ef9h4zpi/ejp13lhZHBDbgLcyRC1n+m1ZiSGeYARfIOQsk7g==
X-Received: by 2002:adf:e78b:0:b0:3a1:f70c:19bc with SMTP id ffacd0b85a97d-3a1f70c19d8mr1667927f8f.48.1746790197611;
        Fri, 09 May 2025 04:29:57 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::ce80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d2c8sm2977553f8f.61.2025.05.09.04.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:29:57 -0700 (PDT)
Date: Fri, 9 May 2025 13:29:56 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/3] riscv: Strengthen duplicate and inconsistent
 definition of RV_X()
Message-ID: <20250509-1b7cbe3ce1c23a20c571d3c6@orel>
References: <20250508125202.108613-1-alexghiti@rivosinc.com>
 <20250508125202.108613-3-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250508125202.108613-3-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_042959_785785_814AF195 
X-CRM114-Status: GOOD (  11.01  )
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

On Thu, May 08, 2025 at 02:52:01PM +0200, Alexandre Ghiti wrote:
> RV_X() macro is defined in two different ways which is error prone.
> 
> So harmonize its first definition and add another macro RV_X_mask() for
> the second one.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/insn.h        | 39 ++++++++++++++--------------
>  arch/riscv/kernel/elf_kexec.c        |  2 +-
>  arch/riscv/kernel/traps_misaligned.c |  2 +-
>  arch/riscv/kvm/vcpu_insn.c           |  2 +-
>  4 files changed, 23 insertions(+), 22 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
