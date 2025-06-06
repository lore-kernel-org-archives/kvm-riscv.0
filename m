Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F53C61CE7
	for <kvm-riscv@archiver.kernel.org>; Sat,  7 Jun 2025 00:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=T2anXQeKOoRmeeJrefSqKjXuOTknp+PyoOVVeYkuafA=; b=RA3/3ac+/tt96dkStXgHwONeso
	Qereuf49kdeSfdVXfm7bvvoodziS3qom4d0mIuI9Q4HaAOruKg2WN27Y7OsvI5zcNMjUeVLRpUgVa
	4FjuB8fY7c+IRv/zGLMq5ETAWvLorGnVoB6qeM0juE8ReFBfAMEZ4kQzEH6ELeYk6FsO//pHENOkN
	6c1fZ4Iew/7Enj6lyWE5OIKKLafcMLJD9lcJV0e3TeAFLwoHvwkPKrUvy13zQAwHaKJIsF+mfnfg5
	L9T+Er0dzHtSxfr+zCQHoWjmZtUx3jsdnaAb9+HnnQ6+E4Anttr+rgJHITzePUqq9ETqzgVvujelm
	u7hV16ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNhKV-00000001BB0-0xIy;
	Sat, 07 Jun 2025 00:22:35 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNgvZ-000000019D9-3JeP
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 23:56:51 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-742a091d290so1959695b3a.3
        for <kvm-riscv@lists.infradead.org>; Fri, 06 Jun 2025 16:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749254209; x=1749859009; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+L9DXCjLorTxOh1B5xNStH2dnZ/sReG4cpxDvwmWD0Y=;
        b=nvYv9AESqWri0ecLfY9/hO4JxTdboeIaPvruFljiVhZA1ktyaXN0Rr0V9cNPBfTieF
         Mc2UdPaaNeyFuz61aHGQzUmpuMvF3twrtP37hOtfyTmnaAzR1zZLorw0L+1l78Uty+hw
         YGnpJLsM0W5GbAMrUrA2ktZthKjb5cISFbKke557h/fZjfaRt+W0V744X3r99a6hcqUw
         Szioc2vOqtPbCBVkUPUi7Qd/LZ1N4YNe84DMgJiuvTro70k/7RlrBuzQ3LSAKGwRmQYm
         xjwYj8gY+SmFo4IjhB5oefJYDNbFMo4CjasAOwmhE6xMEr/aylklJk4xDxOXOHfxcBXt
         gOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749254209; x=1749859009;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+L9DXCjLorTxOh1B5xNStH2dnZ/sReG4cpxDvwmWD0Y=;
        b=toYgoLAtjmgbO1Jj51Z0yduFuv4QQv8iZPqHzxOxyzf45LOBUOZ/XQUjgm49LhZQiX
         QehBrF0v1auPHNFXs3RfA+Fk1LSWQ2O7BXu+rPT/tVQBP6OVmWIcP2qtgVh34AzdURji
         XEmAFgGpJXgeXtO55K6RnBCmnEup92cpRapGDUS652NcPgtaFf4JpAuzQn365aOuSBqh
         Zg46CQo0/27id49G17RZjKjPcuk32RlhkI6VJS2TJRMRjeoMPvGZAJVXNRw8uW0MENlt
         U/UCLP2BgZiExDLH5KfrTt6Lv8VBUBNtVD/pAyJLqLqAZDNr3McuKGvABrHE9EXdnwFC
         sqlg==
X-Forwarded-Encrypted: i=1; AJvYcCXRj3XNc1I8Eaqw4Zzdh4yyVZesw5NJWPWQxBpBjd4LMPa7Kd9DpsKuGUyr3QxzgvSqrXeKPXLaG1A=@lists.infradead.org
X-Gm-Message-State: AOJu0YxDwVHhpq/3GxKqPjNspCq7VbZNVY9KTYyaajvMjnX9TnqUoy7S
	z651WPAW7lTpcs5+Oq7u+UUatk/zDEU/hpx4EMI1R9+rGPSCW2rqZ7GpgvPsRPE5poljzbnuniB
	5eIQSDz+AwA==
X-Google-Smtp-Source: AGHT+IG03XZnvqZOkOqBwMRzzNhIPgcN1ZsHQWgIs4EPRw8vsSrtSnCZF4xjJkBMv/LE7Ar4ODi53Kp40Xk2
X-Received: from pfbdw13.prod.google.com ([2002:a05:6a00:368d:b0:746:30f0:9b33])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3016:b0:742:a23e:2a67
 with SMTP id d2e1a72fcca58-74827f14a6dmr7102295b3a.16.1749254208946; Fri, 06
 Jun 2025 16:56:48 -0700 (PDT)
Date: Fri,  6 Jun 2025 16:56:15 -0700
In-Reply-To: <20250606235619.1841595-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250606235619.1841595-12-vipinsh@google.com>
Subject: [PATCH v2 11/15] KVM: selftests: Auto generate default tests for KVM
 Selftests Runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, anup@brainfault.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	maz@kernel.org, oliver.upton@linux.dev, dmatlack@google.com, 
	Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_165649_862905_5A52ACBB 
X-CRM114-Status: UNSURE (   9.69  )
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

Add logic in Makefile.kvm to auto generate default test files for KVM
Selftests Runner. Preserve the hierarchy of test executables for
autogenerated files.

Autogeneration of default test files guards against missing these files
for new tests cases or rename of existing ones. These autogenerated
files will be checked in so that during git-diff one can easily identify
if the existing test files for the same test binary also needs an
update. It also add new tests automatically in the default coverage.

These files will be auto generated with each make invocation but
overhead should be very small as these are very small files and won't
be shown in git-diff unless test name changes.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 307ef31d3557..a76502406123 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -201,6 +201,14 @@ TEST_GEN_PROGS += $(TEST_GEN_PROGS_$(ARCH))
 TEST_GEN_PROGS_EXTENDED += $(TEST_GEN_PROGS_EXTENDED_$(ARCH))
 LIBKVM += $(LIBKVM_$(ARCH))
 
+$(foreach tc, $(TEST_PROGS), $(shell mkdir -p tests/$(patsubst %.sh,%,$(tc))))
+$(foreach tc, $(TEST_PROGS), \
+	$(shell echo $(tc) > $(patsubst %.sh,tests/%/default.test,$(tc))))
+
+$(foreach tc, $(TEST_GEN_PROGS), $(shell mkdir -p tests/$(tc)))
+$(foreach tc, $(TEST_GEN_PROGS), \
+	$(shell echo $(tc) > $(patsubst %,tests/%/default.test,$(tc))))
+
 OVERRIDE_TARGETS = 1
 
 # lib.mak defines $(OUTPUT), prepends $(OUTPUT)/ to $(TEST_GEN_PROGS), and most
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
