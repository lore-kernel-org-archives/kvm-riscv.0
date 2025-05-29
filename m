Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CC3C54FB3
	for <kvm-riscv@archiver.kernel.org>; Thu, 29 May 2025 22:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yPlkNogyay6pBlE0O3vVchAIta7cKbIRgW9W8FqpW+0=; b=ddtJAYbMj+3IsA
	o3F7ubFOYjAWqfCNzXQwbNGxN0FfBJvOL5F68pXoD9pANM4YXD5htpLYf0Aoyit6k4LZfH0MJB59I
	LvRjbMpEONep5cItHAZvcuVfUPTqo8NFNxWmg+YZYXqld3WYLkHGuFEnWq3ueZHMunmunS0YGY2N6
	logFvQNlgx9ZjjfgyG2CIvj4e71yZNXN7tNPZZ5jTBIA/kXoo6nTjT00P2aCvAWL+581/Z/GMuM7U
	WGZOgv7mrGZUMVY6Z8Ygnlz12dIowOaWYYNuG9GBdZ4a0tbrfHM3RB8j68WxXQnCnjaWo8yFEgk/0
	uwemQZLNJGeR+nPvMFSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbY-0000000GcdI-1INM;
	Thu, 29 May 2025 22:20:04 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbV-0000000GcZb-29rB
	for kvm-riscv@lists.infradead.org;
	Thu, 29 May 2025 22:20:03 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-22e3b03cd64so12397475ad.3
        for <kvm-riscv@lists.infradead.org>; Thu, 29 May 2025 15:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748557200; x=1749162000; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=F38+KAgpKihumolRGdL78BPKTYJ8ucUVHkNHVQ83xHA=;
        b=VfymsAc3/88lSsLJ3DN59sVPrHFtgWUhpgKhmma+Qc2MKJ1KOq4YK9gXkAJJEbD24K
         Be94K3VG90o4D6K9tzMYgmrhrCdCXb0LWEoAw0bO5GUf/epDrQEt9As6lz9gE5QSVQAZ
         dOyytVU+eirLJweS+jdglF1SYridi8yi9FDLYMPjnmC5u75ZlGGRqBp+n1bN104Pk4LL
         +QY9/hMJtkdE8tYDStBy/XE6n5qJ8OeGDFbuonv+V8hYwcZqvu3EpIS7OxpU9JIeWG1h
         tA2C2w0zX84oC2xV6JBQl+FnRakUBFnuaXzBt3+e4qf/9w8YoTOMrBeejIL2afs00nUr
         /+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748557200; x=1749162000;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F38+KAgpKihumolRGdL78BPKTYJ8ucUVHkNHVQ83xHA=;
        b=NrwiPufVi0SJ/b6urxB+8vTP2TF/FFXgGb2EfhTtDssoCnB76yRqAwVdByCCJRKUgj
         eg6NuvRlso46np7zj7/67c/3XPolmRdOY8UfERIH4QDkhBSQLR6d6pvkeaqyoPjNdl7H
         M+36YLTYpXHPvGHJQMiFCZmn5qjlJE5RvpSu9oFyabn+5ow6MDb1TBcCSBMbBZnf4ZaJ
         5nnS41uuFM+3vDTgKhz0w5FskD+sR4eciqdG+NYetXomsr/ppQ1nSIqcikjh+/g+CRew
         CNXXYyGDNWiKp8ok6saNg9WDXO1Dpwez23tmhfNcySYEmrBcBMAc2cXnkTUn8wDeZ7uH
         2Big==
X-Gm-Message-State: AOJu0Yw23Jp/O0QUqRcIU5nBVRcIEFhku8dRXS0A5VcCbUas1VJNKNxQ
	UCQ5vf9KKZiRISgq5Q134qmKJJr452y3FXZTcUvRYexhnrrA+nrl6DX471+Vg+WgMzxR4+fiT6T
	oDUxAEA==
X-Google-Smtp-Source: AGHT+IFLH7+ndNiW16k0m8bZig1m+3YmdXN8wU8pUnGfkU01dcr6pQf/olLFZd/rzUJORoXz3AV9rcYLfE4=
X-Received: from plblh14.prod.google.com ([2002:a17:903:290e:b0:234:d2a4:ddf])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e5c5:b0:226:38ff:1d6a
 with SMTP id d9443c01a7336-235289c81f8mr15314225ad.7.1748557199757; Thu, 29
 May 2025 15:19:59 -0700 (PDT)
Date: Thu, 29 May 2025 15:19:24 -0700
In-Reply-To: <20250529221929.3807680-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250529221929.3807680-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529221929.3807680-12-seanjc@google.com>
Subject: [kvm-unit-tests PATCH 11/16] x86/sev: Use VC_VECTOR from processor.h
From: Sean Christopherson <seanjc@google.com>
To: Andrew Jones <andrew.jones@linux.dev>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, "=?UTF-8?q?Nico=20B=C3=B6hr?=" <nrb@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_152001_586018_C9325F69 
X-CRM114-Status: UNSURE (   7.94  )
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

Use VC_VECTOR (defined in processor.h along with all other known vectors)
and drop the one-off SEV_ES_VC_HANDLER_VECTOR macro.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 lib/x86/amd_sev.c | 4 ++--
 lib/x86/amd_sev.h | 6 ------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/lib/x86/amd_sev.c b/lib/x86/amd_sev.c
index 66722141..6c0a66ac 100644
--- a/lib/x86/amd_sev.c
+++ b/lib/x86/amd_sev.c
@@ -111,9 +111,9 @@ efi_status_t setup_amd_sev_es(void)
 	 */
 	sidt(&idtr);
 	idt = (idt_entry_t *)idtr.base;
-	vc_handler_idt = idt[SEV_ES_VC_HANDLER_VECTOR];
+	vc_handler_idt = idt[VC_VECTOR];
 	vc_handler_idt.selector = KERNEL_CS;
-	boot_idt[SEV_ES_VC_HANDLER_VECTOR] = vc_handler_idt;
+	boot_idt[VC_VECTOR] = vc_handler_idt;
 
 	return EFI_SUCCESS;
 }
diff --git a/lib/x86/amd_sev.h b/lib/x86/amd_sev.h
index ed6e3385..ca7216d4 100644
--- a/lib/x86/amd_sev.h
+++ b/lib/x86/amd_sev.h
@@ -39,12 +39,6 @@
 bool amd_sev_enabled(void);
 efi_status_t setup_amd_sev(void);
 
-/*
- * AMD Programmer's Manual Volume 2
- *   - Section "#VC Exception"
- */
-#define SEV_ES_VC_HANDLER_VECTOR 29
-
 /*
  * AMD Programmer's Manual Volume 2
  *   - Section "GHCB"
-- 
2.49.0.1204.g71687c7c1d-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
