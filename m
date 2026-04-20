Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB3BF5A8C7
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 21:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EZFeBN5fVTXn+Dc2es8ksE5P5Nd2UbGdNm3nQupUx1I=; b=4BneRPIXTYrV9a
	EIkMr8TElazHGcXDdCYrzScnoETe1IO2b7hka6GCD0Wg30/AKkZzKMggBITTwDO4D3MEJtMQVTDl1
	hMO6uchMTfdbien7jOoSjr7rM+KhipY0cwsvydPwyoVmH1LIufnsDE8hDz3qYj0LlSUaf+fkMJ/35
	VvXP51VH7McLv81/fqWRvhi7WBBtyMO9U+maP0hBw9KehI35do8ZEzn4yDxwRfIRx+FAGaW0wT0Es
	hm++JW5Oukj1BF+j7fYd0qSHWKgxO+8RHnIJclI39+af7JkpTeKQNUDOFE3AmZyO9Mp1lckUUsql7
	abAQg4pOG6AzpkDGD1gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw3Q-00000007gkl-1hoi;
	Mon, 20 Apr 2026 21:21:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw2u-00000007g4S-1FYD
	for kvm-riscv@bombadil.infradead.org;
	Mon, 20 Apr 2026 21:20:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SJ5CEXYUlDO7gWqtPrHpSvURrk9AOobHS7RyhGBvd6g=; b=bwZZXAcjH4ER4kFH14qEp2j6YS
	+K+Mm451I2+ntgspTwFJR/2kxwgQB32PDBrSU4w/B4McYAu67gl6bplp/pT0Mj8fsippR9n4biool
	rLsIPqv1lYr8Okl3Cz6qRKpOL2xxOQitMgxOSREvuRYpC4KHzsjgi4Qq0mUtGYe7VtdIFer93uuda
	QCcfklh8ue9nKT8h9tAjSniSIcE2hTmBmx80CCrDWlxFIDTpkgS9/26XEVIJFbq5xnd5+52/c1JkT
	wiZKtYRfzRA0EdTDMynVwPtuqj7UL9YeeWKoN9bz0TRy2LykSqlpkXWSreMlUSfauc39rX75AMlUg
	TC5i2C/g==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw2q-000000093Oz-2cvp
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 21:20:42 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-35fbaada2f3so6227098a91.0
        for <kvm-riscv@lists.infradead.org>; Mon, 20 Apr 2026 14:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776720037; x=1777324837; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=SJ5CEXYUlDO7gWqtPrHpSvURrk9AOobHS7RyhGBvd6g=;
        b=FQg0KyKQc0Xqi0rPzZRSunvEVw5RAQfOs3UlNsmG4eIHVQ0PZSz33Tt2i3Ayi6OwN0
         dW1tENAVtuX3pCyOClu93UM9J4sLYT3lY0uFKYf8F/OtJQtJkC00v3jOCFvA34tu85DB
         9uVhIQztrCy7eBJO9t8c7j+17foctm/CLLsCwvShPMthL8q1QYN+TeNI6RSisiPqWYaI
         5DrwDA2ZyTLhr6De+7CKFJKK1vjoL5OctPLBUT9s6vwyn3r1MrQ6xPGhHcrpowC7BehH
         tLW2TBAc+4DNJT8++nuUXfHuATlI6iJo+foq10PBkgEpQoujujXu0GxIHqOpkZfy5P7s
         M6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776720037; x=1777324837;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJ5CEXYUlDO7gWqtPrHpSvURrk9AOobHS7RyhGBvd6g=;
        b=h2WuViLHhk5dOdPtxkAlKmA4jjsxk92Ut+nuhWXsdMlOoJjDQFCP0XUbyxE6acJ3tH
         Fwy8h371qWyhRWJhnSjuHTUzDXWL6e3mfbNbVr4Bv4jTXhp/Ci679jJSSyUfvb00ntmu
         O4XE9bonEt1f0sAzLxZHdDKFZWVtKAq35WJaoLApHfAAepjEYEh1o6F/TMNiygsXc/sU
         ZmzlZ4GfniQL2P3+q/mgqALFA9mTyHt4cD6C5+/cE+4OmOJqFjD2/A5ob5rI2F4RXzii
         hzTHpRChzBMKFnsVJOu/OjsNDd+gkpQXcMcb3r8Oj8XhWE1t+6bp6Tg0m7bf3Fs54t6g
         kPdA==
X-Forwarded-Encrypted: i=1; AFNElJ+la4TlAfzNAJjO28QbLG46GDY9ulgKCDavUhS0YXbxfBSDXDclJKxxGabJfXiqTtevTmCtfdobWnA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzTdsU07QuXyuWOzblSmNCgwtIa6/1usrIgvolej5a6T5sKj5RR
	zmxPZsmDm2z2Jfjz1LM0xalLb18fPsulWbW+a4HexCHPB6c6Jze9Q4eK7QCkxHhWpQYaW0cyxWW
	e8+DrYg==
X-Received: from pllm7.prod.google.com ([2002:a17:902:7687:b0:2ae:c8e0:1f12])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5865:b0:35e:27ec:dea
 with SMTP id 98e67ed59e1d1-36140493410mr16500380a91.23.1776720036561; Mon, 20
 Apr 2026 14:20:36 -0700 (PDT)
Date: Mon, 20 Apr 2026 14:20:00 -0700
In-Reply-To: <20260420212004.3938325-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260420212004.3938325-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260420212004.3938325-16-seanjc@google.com>
Subject: [PATCH v3 15/19] KVM: selftests: Clarify that arm64's inject_uer()
 takes a host PA, not a guest PA
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
	linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_222040_745061_1C37E9B3 
X-CRM114-Status: UNSURE (   9.51  )
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

Rename inject_uer()'s @paddr to @hpa to make it more obvious that it
injects an error using a host PA, not a guest PA.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/arm64/sea_to_user.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/sea_to_user.c b/tools/testing/selftests/kvm/arm64/sea_to_user.c
index fb06b9dcb3d9..e16034852470 100644
--- a/tools/testing/selftests/kvm/arm64/sea_to_user.c
+++ b/tools/testing/selftests/kvm/arm64/sea_to_user.c
@@ -93,7 +93,7 @@ static void write_einj_entry(const char *einj_path, u64 val)
 		ksft_exit_fail_perror("Failed to write EINJ entry");
 }
 
-static void inject_uer(u64 paddr)
+static void inject_uer(u64 hpa)
 {
 	if (access("/sys/firmware/acpi/tables/EINJ", R_OK) == -1)
 		ksft_test_result_skip("EINJ table no available in firmware");
@@ -103,7 +103,7 @@ static void inject_uer(u64 paddr)
 
 	write_einj_entry(EINJ_ETYPE, ERROR_TYPE_MEMORY_UER);
 	write_einj_entry(EINJ_FLAGS, MASK_MEMORY_UER);
-	write_einj_entry(EINJ_ADDR, paddr);
+	write_einj_entry(EINJ_ADDR, hpa);
 	write_einj_entry(EINJ_MASK, ~0x0UL);
 	write_einj_entry(EINJ_NOTRIGGER, 1);
 	write_einj_entry(EINJ_DOIT, 1);
-- 
2.54.0.rc1.555.g9c883467ad-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
