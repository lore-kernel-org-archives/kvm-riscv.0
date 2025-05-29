Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5CFC5AD49
	for <kvm-riscv@archiver.kernel.org>; Thu, 29 May 2025 22:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SP9aSl+7Mwp/4WfqruTj2GEsExIu8EiH8QAxizLuJz0=; b=UuON8D3CsnbaNC
	DUtfzfcnrDKsDEwzoPOzL6qWprUX0v2yUUvN70Z98a3HtB0lJ5VQdoZ97Yi3H1xUdS6nIr41Yk7Hw
	dMnug+xVSbZLooYUEGL/0aG8sP2vzuaMqYgudWOZlDSB7rzwGwN7QG135/IOTrsqyh9rTZ0zp0G5A
	teK+Wm7qYFVyJjESWSouxzR+mPsnActqAo5MKZXzzwQNIi0Yy0bc99PjcwfJot817PF1nv/lMFJqb
	Wh2+K1QyGgEu53FxprXGM7bpxujrJpN/8q5K6LKNDO2Ze009QQrtck3d57DvI9YAVaPmZUqLNBn45
	uNGRjq0qnT+Um3GMfGmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbO-0000000GcTP-1vG6;
	Thu, 29 May 2025 22:19:54 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbL-0000000GcPw-2tW6
	for kvm-riscv@lists.infradead.org;
	Thu, 29 May 2025 22:19:52 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b16b35ea570so1340327a12.0
        for <kvm-riscv@lists.infradead.org>; Thu, 29 May 2025 15:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748557191; x=1749161991; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Nbpri48BJbTJkPhI+6+t1fCLMj96eqwMn5c+krAapnw=;
        b=yydmcTiTXkhHdQZe84vV9r86a+sQd8Gr/OyN6qk6hrC+7Krq31t6cn7OCIwGbf7yH1
         dvak3yA7ECUOhjIJjgz+9DsRkSJac1NBZExQJbAWnopH6WPS2fzmGRLVAwuaGSHKisa8
         +8ku0hWWlLKl8BXsfQErggg0Q7RIe/FWZJ5FOBTHcn81lPXlg1U9pwDiWTtZugaFvoHK
         PxaDO4VeBvrPrPywJgaH++dAT27FjFMp4zDNOhZw1BNyQZFCeC4jnJFAx9rIIBsukOq1
         v5AD6JYsyBCySAYzqdeprmZJtEbFQU91JWlZaOHaFySyeu/7lbuaJO2zxPC5GOX4vNAD
         0dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748557191; x=1749161991;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nbpri48BJbTJkPhI+6+t1fCLMj96eqwMn5c+krAapnw=;
        b=Bq+4gtaiIYH+ESMUgxhGlrBk/7SfbdqcnUMr4fRagQFAecDR+++YHwk7lR2Njnjbo4
         k7lvQlG9ta7lrjjVaoJhAuBJnZ9bzYmYrUzpBc86mEXsytxFiR2uu+6li3HbQiDanNhK
         tb20na+bBynIUtpnWm8KVYdxJ4PZZWUF4joAUy5DOzaplkyGIlbOof92gB6jM5XkrPlY
         8jnTDs4NjfXqh5Asry0WHgg5r7klE0gNuqWKza5S5Z4vXtB6GMEyLx2l/g/CKxMGEAsh
         tLKkhfmqrDNt7la4tNa2jb1Iz5TOlr/CquEOslp8rIl5H81EjHzWxUjn016yF3tFh9s/
         iqMA==
X-Gm-Message-State: AOJu0YwePm/GlaVj8hKEJd00OU1IdcCJS5CqxBQIsEkBV2fydzLDuWOJ
	gyvJG5qBNbGWFvukgJjUsnD2uGoUJjZLjC3/bdykGakwH9beWfgL+eRCLVKvVFLYfAC/Owjsb6/
	E8+Zrkw==
X-Google-Smtp-Source: AGHT+IHuwZNfPgyrnwyADF8g95T4zavwWZW00oX7NuXupAAgJ0OLZRFru6H+XVBmJZXEVD6LLJdmi6syi64=
X-Received: from pfblt12.prod.google.com ([2002:a05:6a00:744c:b0:740:b0f1:1ede])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:46c4:b0:1f5:7d57:830f
 with SMTP id adf61e73a8af0-21ad978d702mr1874768637.33.1748557190764; Thu, 29
 May 2025 15:19:50 -0700 (PDT)
Date: Thu, 29 May 2025 15:19:19 -0700
In-Reply-To: <20250529221929.3807680-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250529221929.3807680-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529221929.3807680-7-seanjc@google.com>
Subject: [kvm-unit-tests PATCH 06/16] x86: Add and use X86_PROPERTY_INTEL_PT_NR_RANGES
From: Sean Christopherson <seanjc@google.com>
To: Andrew Jones <andrew.jones@linux.dev>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, "=?UTF-8?q?Nico=20B=C3=B6hr?=" <nrb@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_151951_727049_3AE7FEC1 
X-CRM114-Status: GOOD (  11.22  )
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

Add a definition for X86_PROPERTY_INTEL_PT_NR_RANGES, and use it instead
of open coding equivalent logic in the LA57 testcase that verifies the
canonical address behavior of PT MSRs.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 lib/x86/processor.h | 3 +++
 x86/la57.c          | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/x86/processor.h b/lib/x86/processor.h
index cbfd2ee1..3b02a966 100644
--- a/lib/x86/processor.h
+++ b/lib/x86/processor.h
@@ -370,6 +370,9 @@ struct x86_cpu_property {
 
 #define X86_PROPERTY_XSTATE_TILE_SIZE		X86_CPU_PROPERTY(0xd, 18, EAX,  0, 31)
 #define X86_PROPERTY_XSTATE_TILE_OFFSET		X86_CPU_PROPERTY(0xd, 18, EBX,  0, 31)
+
+#define X86_PROPERTY_INTEL_PT_NR_RANGES		X86_CPU_PROPERTY(0x14, 1, EAX,  0, 2)
+
 #define X86_PROPERTY_AMX_MAX_PALETTE_TABLES	X86_CPU_PROPERTY(0x1d, 0, EAX,  0, 31)
 #define X86_PROPERTY_AMX_TOTAL_TILE_BYTES	X86_CPU_PROPERTY(0x1d, 1, EAX,  0, 15)
 #define X86_PROPERTY_AMX_BYTES_PER_TILE		X86_CPU_PROPERTY(0x1d, 1, EAX, 16, 31)
diff --git a/x86/la57.c b/x86/la57.c
index 41764110..1161a5bf 100644
--- a/x86/la57.c
+++ b/x86/la57.c
@@ -288,7 +288,7 @@ static void __test_canonical_checks(bool force_emulation)
 
 	/* PT filter ranges */
 	if (this_cpu_has(X86_FEATURE_INTEL_PT)) {
-		int n_ranges = cpuid_indexed(0x14, 0x1).a & 0x7;
+		int n_ranges = this_cpu_property(X86_PROPERTY_INTEL_PT_NR_RANGES);
 		int i;
 
 		for (i = 0 ; i < n_ranges ; i++) {
-- 
2.49.0.1204.g71687c7c1d-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
