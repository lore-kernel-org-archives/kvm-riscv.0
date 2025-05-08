Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B248AC3ABC0
	for <kvm-riscv@archiver.kernel.org>; Thu,  8 May 2025 14:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2igHrhGn5EjIew4gVkFnmVUBY9Wkay1rQRu4CX1IbsQ=; b=W8ag+0VQgdvrY0
	v8HCmipsHMqF9X+dDoBFK2ri/QxTYoPxUPb6uNBj0AHPH6x/8CNRkAagu2Ckk8ji6Q/JrF/adw2C5
	6z6zfHqUAoqazJKBtIoIQplKqIgfVBDePuiROybL1+8hhX0o/WgF0WYXl4q0aq5JX/PhWc1cJJiz5
	BvOsxnO/y5XbGupBEIwv/wPW0nx3iJ2Eh+9vJMilU/bTfmXwiOZL62dObAEITNN2KKCkGe6OO1Evs
	9eWznNbk+9ArkcRoYstEh2ghk9DQ/WbPN/qqJlPs0x0wwVwoAIkG9B68rZSdXFMag8IWWnJNo2euS
	fseJzyZGr/ix7hTDloPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD25n-00000000tQC-02Ek;
	Thu, 08 May 2025 14:19:19 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1LC-00000000krs-0pEt
	for kvm-riscv@lists.infradead.org;
	Thu, 08 May 2025 13:31:12 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cf825f46bso370245e9.3
        for <kvm-riscv@lists.infradead.org>; Thu, 08 May 2025 06:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746711068; x=1747315868; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6S+40JPuRC3gzWdqTu3aQzXeyhaHlO7szVi8IcUpV9U=;
        b=iZaXVbFBcBEPIUYyke4nxd8KOE6FDcOZQhgwyWAyE/1HFYlDG+5La3sbiuv9Kbu74x
         /FLIpJLm+x6pYDUTw6wWYAaUdRlrCc+MWWa6fmP7OSoWl+EDdPRnGOff1p6D0bodUWdM
         S+aRFAtWn2paPUtZFHSdWg5IpDnxVEuD0JvuzkheKkGrwaRaQHuqB8GXQlDhpP5Cmr/f
         JLykpdig54lDiQOp8PeX3qS64hMKVPsELJhMy3BgwMaTk+zM108rMhDsa49v/MaWPV0p
         dJmdjQbLSX/DIXTqCnmxNW5OYOKm5twdSJinZWWk/DfHpm1j4pocAy8whxyqMa95Dnsu
         SO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746711068; x=1747315868;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6S+40JPuRC3gzWdqTu3aQzXeyhaHlO7szVi8IcUpV9U=;
        b=beKdK3djky2eety2K8hVZImbHqqHAtnIBkX5KN+sfjoAc19g2UaGXDGfaKcP3tA0mp
         aAU96M8a/XuPHe/yEPBhj0MWXFHr8x/8Vdn/dKXJZId5oFFL0JvW9P3atM2u2xHCZJiO
         R0pMmh4+cOaVqrwANwIKHxXZwESy9PwIXYVtcl7xHzk2S/oGfnLKswnPezB026I8nFHZ
         knb7d2gIxVCcXSXfscZu2Wk0sUi8gcoiHT1V6f2WfbYiACfwuydgTgomXMM8ciUnqENd
         M7DM/rPwAqhdfX5KyFh1uQOwXrbnn0tGJQPAw91MdCab+ePL35d4j7SrVnDVK9yFyNAA
         0VeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVygHIpdYoag6fw+yjOtL5oNAZr8ZNIMHRMBXLpa5P0Bm9I8c7UhHmAerOAzE22Yi9rjW+cATOP5M0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxaci/zPsYQVSwPrIV3bPKv5+icGyGPiAmIyhk0SJyNEqlKMF9M
	A+pSSIghftgVWXU14z5VleGTpq6D7tF1v/W0uPC2ksv3nPaKOeyfzgoqlhYaX24=
X-Gm-Gg: ASbGncvfHks9T0SnVj51AB4Kj/4P8GwC7qLSpzK7Zd2bWSc5QZ1INo/fqddnyUyy9B7
	vi68NQf/jEh/wU4srkp9ZREN0sCD6wMlriP4SPTc/oYQqCzv2adkkVHhsEegIAQPo4iMHn54AAL
	JSdZWcLHcfYmj7Q5FeWBiFhew9m5gqXlQj7DDtOT2s78+h1ecXnOfTdk35fyCHSvkIu6iN7h637
	HVm77FxpCLN0EhquUW5aBMjtkMKr4L5JsA1rr5VxQwEKaKwJTp3T4BThsfLJ4xIgPzB1Y80t3/X
	M/shp+k15wvFrctBGfSWep/himVlqvc7sGiYyYFFnov70Y/p
X-Google-Smtp-Source: AGHT+IGijAnvSUvNKAgb7ZNKd5QJJ9UF+zXOT/jF3FQWpi7RwPSldc9C2Ir4SMyQ4xieyEHWiNZ1qw==
X-Received: by 2002:a05:600c:1d8c:b0:43b:c825:6cde with SMTP id 5b1f17b1804b1-441d44c4749mr23230845e9.3.1746711068529;
        Thu, 08 May 2025 06:31:08 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:a451:a252:64ea:9a0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f238sm37108665e9.11.2025.05.08.06.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:31:08 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 08 May 2025 15:31:07 +0200
Message-Id: <D9QTEAUN0RNE.11G3ZW4IBGL5M@ventanamicro.com>
Subject: Re: [PATCH 1/5] RISC-V: KVM: Lazy enable hstateen IMSIC & ISEL bit
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Atish Patra" <atishp@rivosinc.com>, "Anup Patel" <anup@brainfault.org>,
 "Atish Patra" <atishp@atishpatra.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Alexandre Ghiti" <alex@ghiti.fr>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com> <20250505-kvm_lazy_enable_stateen-v1-1-3bfc4008373c@rivosinc.com>
In-Reply-To: <20250505-kvm_lazy_enable_stateen-v1-1-3bfc4008373c@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_063110_250032_C2BE17EA 
X-CRM114-Status: UNSURE (   6.33  )
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

2025-05-05T14:39:26-07:00, Atish Patra <atishp@rivosinc.com>:
> Currently, we enable the smstateen bit at vcpu configure time by
> only checking the presence of required ISA extensions.
>
> These bits are not required to be enabled if the guest never uses
> the corresponding architectural state. Enable the smstaeen bits
> at runtime lazily upon first access.

What is the advantage of enabling them lazily?

To make the trap useful, we would have to lazily perform initialization
of the AIA.  I think it would require notable changes to AIA, though...

Thanks.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
