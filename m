Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C239FC0219E
	for <kvm-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 06:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xi+B4g99F/7RnjX2fIRyyDFuvU02UpwwMAdifysP6L4=; b=uF5nEBDRIQxSc8jkt1bhQN3uMS
	S8qmhAS5b6ZKvnHFIT8jR0+4C8PCxdFK+Z+a9Iq/bNJZJA5JdTkRKrRw6w+lYwjS/G3Q9ItZ7CV6N
	j6SZ4f52sLsvtDnRDUM868zqrHodbH1cBidyC+O/vsf4Sq3yNls/9K6GTRxskciT3sS3TWuin4LPX
	yAgkCRUHrG1Pdx3m+ZdJPVDs2qvm5aYKprmIxp1mq7zJWJKnjqaRUDC/PMEQevR6F0W4x3+ZcwC3a
	5J8cPE4L2HFw83jN8lN4Fqu6h1A6jg4ebN77SFfoMws9RCSq6vGEv81ijGphnSb2PTu0TS4u8q6Ju
	KssYljCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thjP6-00000002ebm-21HG;
	Tue, 11 Feb 2025 06:05:52 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thjP3-00000002eb2-3C5B
	for kvm-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 06:05:50 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-21f6022c2c3so48401565ad.0
        for <kvm-riscv@lists.infradead.org>; Mon, 10 Feb 2025 22:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739253949; x=1739858749; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0MBqIRdwxcxCwshRcxNA0crppewQ5oTYfihHZZAluN0=;
        b=HaeAQoiHK5A+qmrnRcMB3Ypa/TJmTjGk3Yf4aSPX+4DEzeI5UdTrreFEOAdsS5rkXH
         zAq4nPaqqYzz2ZPk2RY1I5UMwRDzUVIzzleNlkGby/lpWnICr2z6fR8u/UvJlk7YKNd9
         lvbMjyiBYBC0E7JShg7LBJJt6PwtJH6/a9yMesDJXkk26nTFj4AZzMbx0h0ZpJWrlu15
         B6pDCHkriMypNKAD8eoQl6LPjXJNDwSLOe5+ezMxuK72sr9yW8NO9K89IPoLLpNdlOAt
         xR344MjjsvZAMuIYwZgF+rn4AnfELQqfSc8V2cK2yAW6dwBiNoY2URsoNKcqN0y5TT3c
         l/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739253949; x=1739858749;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0MBqIRdwxcxCwshRcxNA0crppewQ5oTYfihHZZAluN0=;
        b=CV7wKpB3SPlUFghRSz/rklhhWNrYD2O+a0CJ65qYinSnXN5QnS5Ta4PzCfsCu8it7T
         oRLeGAoMYPsnRJylQOBU94v1XvEZSwkqmdgId/AjlCdjzm58vw2hQ5ZH8hkhwoFNTKmQ
         GrGiXa/tQXbP3uY6+Qdc1Nb/DhbaJ6O469hn+30pmvwSfXubeq3meLM1vbScxqifR75k
         9rnDs2SAHUSteA3FYQvLv2Vzf7PnAQsHo4fExFCyf15m/zxBBJoi+KrJnpWpyxqKOr/Q
         t2582i9Z8e8AthKJQZH3cB8iqzGUVUhmmlbEjVYz7m7loVHZoARh+b2MBSZBt/a3djEg
         1hWw==
X-Forwarded-Encrypted: i=1; AJvYcCWCd4jzr0IlbuDhVZhOrrXqmhghudWWgW4Tbw3vZeqdMDiJs4sJJquI78idhP5Q3x1Ybth8uehumus=@lists.infradead.org
X-Gm-Message-State: AOJu0YyfcnFfjla7y2tT0HvCezEgSe5Jh4KMpmZXRdJF3b4yOeyeuiPw
	L+Y+twJMSAG2yRpCcFUL31ZTIYM2Ay8AE5YsPk0/b8fO90k0O8u/+I2RokbbwWc=
X-Gm-Gg: ASbGnctEXs8JvLnpjEQH0pJYYeGPS4oyX6kGD7CmDhM1REBsxj29UPoOVECkXoBKSrH
	MYa+oaW0lLAJ9nRywEms/ceMs5CtbrRK35YnoJnz+CsrNrzEjss/6AFczOauYa6/uNQg8EXkJde
	F1U+5/TGqXgeb5mbwZF1cXG11wP7HZlpUouGH2Ryp22TWN/vPb3r9WozzgPt2XEJb4kISibig4q
	gwL4kUEcmPmcAKktgopAoGxvLL9pLDZsPEHHw0Zi8MKpJ/4kMa/VSaaXqoe14ORDttuLnXkEYQU
	U2bczMETt3tGw0uR1t1aC8nsvg==
X-Google-Smtp-Source: AGHT+IH/1R26NlLJZyOyqaoXeZYqCyF01+N1vBhKDh4u7o7gbIXbZU50VOk7nAyf7jdBnJTufNHygg==
X-Received: by 2002:a05:6a20:244f:b0:1e1:a920:225d with SMTP id adf61e73a8af0-1ee4b77355fmr3102269637.19.1739253948792;
        Mon, 10 Feb 2025 22:05:48 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7308aa3a1cfsm3437000b3a.137.2025.02.10.22.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 22:05:48 -0800 (PST)
Date: Mon, 10 Feb 2025 22:05:46 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v2 15/15] RISC-V: KVM: add support for
 SBI_FWFT_MISALIGNED_DELEG
Message-ID: <Z6roumtGyFOfoOiw@debug.ba.rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
 <20250210213549.1867704-16-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250210213549.1867704-16-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_220549_801597_E0AC05E1 
X-CRM114-Status: UNSURE (   7.81  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Feb 10, 2025 at 10:35:48PM +0100, Cl=E9ment L=E9ger wrote:
>SBI_FWFT_MISALIGNED_DELEG needs hedeleg to be modified to delegate
>misaligned load/store exceptions. Save and restore it during CPU
>load/put.
>
>Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>

Reviewed-by: Deepak Gupta <debug@rivosinc.com>

>---
> arch/riscv/kvm/vcpu.c          |  3 +++
> arch/riscv/kvm/vcpu_sbi_fwft.c | 39 ++++++++++++++++++++++++++++++++++
> 2 files changed, 42 insertions(+)
>
>diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
