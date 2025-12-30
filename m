Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E296EE57C6
	for <kvm-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 23:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dckVj/H71BGD0xjbVNxM1oNGQp/cOFSMiw/TBgg3iHU=; b=TqAGHZf84dAotp
	dlRe+qwzYrGIgtLsr5iTAjom1ZR7E1FJQ+7aDbTAbAiq4HonJzoE5XtZUyNGmd/YpRSGkoxGDka6U
	0ywdaz3wy6pO7g56kKIEZz5BZmFSvq8Vk0PFkCeUShjV2mbbK6z6Xzb+053rDtulXbNuCtKbcSBOs
	vYqbVKhLBMiHs6/+R8TYR7ym0cvngx3SAG55KW2SKtlDfCG3VBR/I04tLvbsdTsomxMI7vpRrpX9S
	LBCO9TN/aYTo4oe4MGqGAX9YsKF3dyRzcryv2ET6L2JXFEK692UMsvEpwFPfgI3ce77v1/++pG0+a
	L1IvCzVL7nr5fs+A1q3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijO-00000005Myi-3X3R;
	Tue, 30 Dec 2025 23:02:22 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaiix-00000005MfN-1zdJ
	for kvm-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 23:02:10 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-34c387d3eb6so9527453a91.2
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Dec 2025 15:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135714; x=1767740514; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=DRWkfiIT0OBRt/HR5AGE/0OZHtoELcBJ5J9uDz4mIeY=;
        b=us5FCwSLRVbM0IxAjY3C/CRp4RRruc/fisb1aRwA7SNHTQIaWWFgxlHAeaw+y8bBFp
         Tn9txB1HKQJw5fbY8f6hSGFbwBN4AI6uIMj2Dh2hc5LqivlH2pm4WrQsw4+5AQspnOTA
         pTWzfEFjRAECWNmagBi4AU+kFNviYozZVkoRHgWDxiH96wLq0EA0X63j2NQNH8YWaIB0
         7lFvmXj9dbMNlKjZK+08aseWs6AyclP1fvXidqgi7203ytcDMND2MQViDNFtOgacNRPK
         TWI2tMmVsuSq1/emPgooiJ3odA8GMBqI/dtgMfV5vTVa23MbD16GwYrYBtWNVeC02sIP
         E9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135714; x=1767740514;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DRWkfiIT0OBRt/HR5AGE/0OZHtoELcBJ5J9uDz4mIeY=;
        b=Zbns2BtiHI+YsSAmjpGVHFJ0V4FqSyjP6CZSDUv+VwlP9SeJ0jWnH68QqjIqd4cWJE
         viAZIY1iudi1F0XgoR88RZeixRA4/Md6J/dVUgiclr4fh1UIG/M+Mz7XKINzxwlwM5C+
         OTHFUJJplJIq2rqQlCJjMix99nHs/LOS/4GZfq34OMahvT4YBvWUWamScCTPb9VSGv7/
         tQRkwL239HBZkBHfVusmbgdNe/ay4iGq3iNBlXiV9sjOmFGkgxlfi0gn3lMR8CWJysZs
         xC1D4gQqlgEk8Xinh2bSP4WrEFbeWyAERF46mzKnFzN+73CAzVw1vH/brQSRQQs0JSZP
         ls0A==
X-Forwarded-Encrypted: i=1; AJvYcCVIVvvjvd85lzDHao49S8OyWSRCH3Q2Zrh3KRLAqMOfEK0ppN+HgcKbYizZSwkCQVGyeRIpfiIBMM4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyO+XDU8muS7i62cAwwsynh97yX7KhRnk9gAZBoNnT43JUVax9L
	nafpiiIGmp+F/rI4JLRXdDsLMsvejql25s4wiDnptQmx0AB89LGRIGVpu2qc6CFfmTIv1ieoeH1
	t27OQtQ==
X-Google-Smtp-Source: AGHT+IFqovkU/eUlOykY6HWolLjXCahq1FJtAZ+GEK7lClBpAjuVhdcXVPtQL/MTMKhhYaxAhrGpJ6Ohw/A=
X-Received: from pjmm16.prod.google.com ([2002:a17:90b:5810:b0:34b:fe89:512c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2f47:b0:34c:3501:d118
 with SMTP id 98e67ed59e1d1-34e9211d455mr26888073a91.1.1767135714342; Tue, 30
 Dec 2025 15:01:54 -0800 (PST)
Date: Tue, 30 Dec 2025 15:01:30 -0800
In-Reply-To: <20251230230150.4150236-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251230230150.4150236-2-seanjc@google.com>
Subject: [PATCH v4 01/21] KVM: selftests: Make __vm_get_page_table_entry() static
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry.ahmed@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_150155_513543_6D4CC3B0 
X-CRM114-Status: UNSURE (   8.69  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

From: Yosry Ahmed <yosry.ahmed@linux.dev>

The function is only used in processor.c, drop the declaration in
processor.h and make it static.

No functional change intended.

Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/x86/processor.h | 2 --
 tools/testing/selftests/kvm/lib/x86/processor.c     | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 57d62a425109..c00c0fbe62cd 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -1367,8 +1367,6 @@ static inline bool kvm_is_ignore_msrs(void)
 	return get_kvm_param_bool("ignore_msrs");
 }
 
-uint64_t *__vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr,
-				    int *level);
 uint64_t *vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr);
 
 uint64_t kvm_hypercall(uint64_t nr, uint64_t a0, uint64_t a1, uint64_t a2,
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 36104d27f3d9..c14bf2b5f28f 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -306,8 +306,8 @@ static bool vm_is_target_pte(uint64_t *pte, int *level, int current_level)
 	return *level == current_level;
 }
 
-uint64_t *__vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr,
-				    int *level)
+static uint64_t *__vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr,
+					   int *level)
 {
 	int va_width = 12 + (vm->pgtable_levels) * 9;
 	uint64_t *pte = &vm->pgd;
-- 
2.52.0.351.gbe84eed79e-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
