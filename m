Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92692C79FB9
	for <kvm-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 11:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tvwmzeiJSIbefP/Fb6DxDeU2mq1U02PRG/ElQO1uj5I=; b=I9BZqg2zA/i+eJ
	ckLyVeTtPTdp2XCipVaku45FIODgXaq7/I7bIEp/Us9Sz9j10hgffttq7UCh/fcj4T6dybZw/gYQP
	uiyiyAYUs70YdIJKYa8G1SQPNW5+9o7LH1YWnTOrjWqLuwszc0sP0zm92UOmQfwKN4nWB+pGbPg5p
	CiI3IdGOtsPCaGzwHn9a9hE/DzH6hwMSoFyWbUnJpZW99tkw2dhwU/p0jDx98ttD+Ag7iCrLh/eD4
	D7ls4uz/1JROjZLp0DrtJz5H0ndkvZ6Hgi37vwyCbPGcrjDasaNO/0DuQE0AmCthqt7SW5MBX56vo
	CwjEgYu4/Mkf5q0Z7uew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cd4-0000000EA0Q-1Ipe;
	Thu, 10 Sep 2026 11:07:42 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cd1-0000000E9yf-05Ke
	for kvm-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 11:07:40 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3990fe066ebso5677118a91.1
        for <kvm-riscv@lists.infradead.org>; Thu, 10 Sep 2026 04:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789038458; x=1789643258; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=70Xrz5Ek18W9RLHK+PGrZl6neyZSU/LQLxpuqNmBXms=;
        b=qsALKBLuc6lRqR5oN/vSJjJYT7w7eMasGac7SBilwBbckJ02iesHaDh67Ye0NByrtw
         YGYvTT/L+zDcpLTJUt/Wo1qNINN4vzd3cHAqx0IJpsunfacx/v056DCEJetaEDiuWxPU
         0Gb+3975X8l6JAMfE0ZQAqiApcVY7SdmyNXaDriFuIFy7j5z1sSXobZtm9wVEJ5GIT9q
         0rdYjOd2CBdNqxN3H2JXXJnA4/tkmRhSn4YY77LEUdzBZuRzklRJyN3rciDPWjuAYfYU
         faM9YtPZhsrEgBZO4N1eNat242aMPsmkIdPcmF6/2f09wmP0WtKNhx4XI/N4pKa0mNyq
         xCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789038458; x=1789643258;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=70Xrz5Ek18W9RLHK+PGrZl6neyZSU/LQLxpuqNmBXms=;
        b=SX3BmTwUhM8vS2p7TgvNu4GPggRUP1/BlFSWGq4d+HJMIjrpJazjvppSr9K8jaof1K
         J/8ciURQ0e4SrAkT5cztnwTFe6eHECyow8zVK2hxyYzoWQD319qA0pGlfd6vVgk0ZRb/
         lv7S58FONFEMn3CBxmtnP6QCg0a7zjO3Nv95aIzY4oSxLMhn7YyF8p7otBs04zPn8YRd
         KU6RVscacSev3eWoClUIIFjGMHrU2H8ujqY7kZIz5kJJYtGfQnV1ooWOHbojhyOpdHBW
         NNoZPnv4sC+LkE6bbc9V0lJMvq3U5kq2Pk9ZwwpepQRDGvZBVfcQeMeN5UsKLNeo7c4N
         nuAw==
X-Forwarded-Encrypted: i=1; AKwUvByu5vuIrx3wWWjsqoh1zQkQcuxOnXZNjbWELxBme/OptbHG4LnQbDSer2isIwkdrOCQpccmzIJ9R5U=@lists.infradead.org
X-Gm-Message-State: AFuF++nrlm0s9MSVwx6oDzftd2H9KTBNOEO5dOqe5J57XRumWMRlcv6w
	7ClpcHrIRCIp/ae+mxygA9RStMBu2rn8MLHO1iw6/2MxEkBj9d/WPspC
X-Gm-Gg: AYBFou1ChXjkP+gpJ1o/ISe6dE4EH8QOLHAOCO5lBBirPfRhlcUYqwN+55rKMEYOyLY
	4boG47/TpanLZJ0WsxyVNcui5eNip0re89RDev+M8ZQKCPhQknMVxHGJy5hrY2V5EPjLAPeXkaV
	xStZUDtd92yVtUPUwArZ7WSN4gnwx7MevfctmdULZCtY7eYScIUwMxw9ICwA2LFsSfvKdoCx7b9
	T3Tw+tkq7NuoUUa/w0T2u+tYJFMDsfSl+FhfZadrg2G0JFSwphrCq2t0ESHJIGZR9l+zA2zFP1N
	WERIQXc4vfIXE2z4bFduVLjk54akRRS8L+dQ/M1mn8C5w2EanM9eywly7m4PrdAudp/XKPmqUSO
	pC2oxydAvBBzafbpiX5rSO0d/HHWiJ/J1BDt9/XFa2yqLrxG8uFlFifqVAnzjKaqOQRP/K4kzeG
	VFijOV6LUzfdJUTJ7rotPJ/vYmMtm2N3o7K7ykPUeHN09gamWkr7CpgoNQ76kN5o8OUum6rEX7m
	WCz4ghGQawzm6dugjBAzniHutp7hZqol1Xl+YR0eDMr9edlpDu84Rc=
X-Received: by 2002:a17:90b:1b06:b0:398:9be9:ab8e with SMTP id 98e67ed59e1d1-39b2622ba26mr58218547a91.19.1789038457819;
        Thu, 10 Sep 2026 04:07:37 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm43023781eec.6.2026.09.10.04.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:07:36 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 10/20] KVM: selftests: Add a wrapper API to allocate multiple page table pages
In-Reply-To: <20260902164123.2546762-11-seanjc@google.com>
Date: Thu, 10 Sep 2026 16:34:41 +0530
Message-ID: <8q591i5y.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-11-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_040739_059555_D01A6FD3 
X-CRM114-Status: UNSURE (   4.65  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Sean Christopherson <seanjc@google.com> writes:

> Add vm_alloc_page_table_pages() and use it throughout arch code to replace
> open coded equivalents.
>
> No functional change intended.
>

Straight forward change. LGTM.

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
