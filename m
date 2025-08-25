Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62ECCCA0EFA
	for <kvm-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 11:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r4G1KYYoRmfKOMTJbS305COqIJ0bolC9vmIyefyiOAU=; b=v8D1oShau3cBMD
	apUBehxwKPiNpAQRqon9If6vYM4hJ1DVc5aO3mKz6Sf/Rcvq4VHbn1fbKQZb58e3oIJBHU8q/t1j+
	5C1EtPgjZyi1Yq7m4Tt9ApSiYFVJWHRnAIHM7CpxHPtVkylaEM6TXoaJDXdqAxMVTf1V1+IwvTVlb
	2CxHUb6e7IOPxvyIYcetiwZYW5edsTIFZHaQFX21R5xteansIMwoy7BPeUPlvzx6eZwxXUshQI/ae
	NZlbcdwEgdtSW1ENx6mo+5t79t1LFhS72c7VDBgBV6RGDZZ/q/Cf/4bQ9oz24kyM2U3pq9hih/WFy
	3DDQLugoRmFaMoygfbYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVbM-00000007ou1-3Hdh;
	Mon, 25 Aug 2025 11:43:04 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqUyG-00000007hga-2qi9
	for kvm-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 11:02:41 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7e87061d120so425825885a.2
        for <kvm-riscv@lists.infradead.org>; Mon, 25 Aug 2025 04:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1756119759; x=1756724559; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1KrFoOnuL5GMtaq0YKgHhpMxoakpxp6Ykplg7n1PuXc=;
        b=LfNrPM1uRyx/mtn03lz3iqE5UtXEsXd0YBziotMpHQ6LShJEzDl4hVVYMfs5vDxzgI
         xynp3zGCTh1uHDH5/r2mhpMCfgK/5dHUFZzvtXkdM/ldHX8D5Zi9iHZkHs71RLI2SQ0w
         SAQaXMxvaxeFAN7qoRwwbAA/gz31HEmKdGl5XuLyFxaASUNerE3NYOe4fNE/xMshEn/I
         cO96sh05Cj6mfcezKpbsRj/JildZqEvnqI3rBn1EtL+Op9pUsTCtxc5Vf1RFS6/hizAM
         4GCqcngovGuFfXAwrl2W1zA9RVKfZs/gtvP8efgNhVZq983scU0/TYzuKfPuekiUIFun
         M2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756119759; x=1756724559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KrFoOnuL5GMtaq0YKgHhpMxoakpxp6Ykplg7n1PuXc=;
        b=Z25bd7Z0MlH/KNwn0uoEDeTphCm5TKiXp8so2EPwzzDOar5I7ThvrKLN5FY1DelVmH
         osuxYpZkqD5T5FLuDDyBy4W8kmC8zUnT2r6cjI5rI7YOiuukcmhr09exweMaF+PVpjut
         yYPLw2vB3nLdKa7BS6/BItjcQMO4sB985Qq2bmwlXhRezMsYgB08VBxDmfomCgnq0lzy
         yO6Szi8fF5oYiH3/W+tBvsblc/dBGT5CEqeA+vH/eMKrTYgRxCnNCL0+mPFr05BdBsAD
         X+O9Dk+tagprEEFvLzn1HLURrMY1eEDWMbOJBGOFEpQaCyMSSrqbKUu5U0Uyci44E3G/
         jOKA==
X-Forwarded-Encrypted: i=1; AJvYcCVPVzJ36T0DA/X/57d/gqNlyDGDWNyN04CwfXMCIq26wnRUa7I2bKeXqpRCH/U9UN2NlwQ3k5XJoJ4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8ebxwAcf7CAqb1EM2v/BSsV+eUCosAj4yEkYZmfaloPcilJr8
	bm9kQa6MfCw7U9/i5TsoB7h7UTsCwGe5RjQLUyAxaX5WHBpe38EzBpXb45kRlepV6WQ=
X-Gm-Gg: ASbGncv8gf6Udk3b9vku/TVVbWqNI2b7gAk4qMk6OL7edQHkCnbC2zaWODiuPWQIo21
	oMY087/wXu20qtigJe7kO5zU5xA/1ZgAAFFrjxBeRdQYUUXnuOwu7RWOleIyEYyqjXYWC//DP4v
	E0qgcVnvdpLH82Q10pEixnIKVzeNhUhT+pPqnJKXwE4adv05jIOcQ4Abx7Pl31dN1capjfCtJEF
	gdwOfvXHD5yRmwoiJlv/ZSKdz/GxWfpL+pB+aqyae34rfVJ/poZCoPCJ/MwV5eEfNpIlUvY7Ejc
	xysm5i/OO0xbPz57L3ItiEtandUZnPtuWAeiOH3AhsW4t3rounRl3KwvQ0NEHh+nExDiBgrz+nY
	MBnoxS2Qcb8wkvTzFsuDsmgNqHA==
X-Google-Smtp-Source: AGHT+IF+Xp2kSkiYMs9XH9xufQw3bih7peJ51tO8RYHjQC3ESxBEZ2qFaKuTNArd2lSB1l4CzhQLSQ==
X-Received: by 2002:a05:620a:1a98:b0:7e9:f820:2b46 with SMTP id af79cd13be357-7ea11082af5mr1233715085a.82.1756119759186;
        Mon, 25 Aug 2025 04:02:39 -0700 (PDT)
Received: from localhost ([138.199.100.237])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebf3bb4e4bsm463662185a.60.2025.08.25.04.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 04:02:38 -0700 (PDT)
Date: Mon, 25 Aug 2025 06:02:37 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 6/6] KVM: riscv: selftests: Add SBI FWFT to
 get-reg-list test
Message-ID: <20250825-5f0ede7adacb9fcc102d6cca@orel>
References: <20250823155947.1354229-1-apatel@ventanamicro.com>
 <20250823155947.1354229-7-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250823155947.1354229-7-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_040240_720984_58B69D6B 
X-CRM114-Status: UNSURE (   9.74  )
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

On Sat, Aug 23, 2025 at 09:29:47PM +0530, Anup Patel wrote:
> KVM RISC-V now supports SBI FWFT, so add it to the get-reg-list test.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../selftests/kvm/riscv/get-reg-list.c        | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
