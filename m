Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E931E7718B
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 01:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Npj/c+3bJIZD+HUcKSBjRe/oroMhzUE9liILFeupWIM=; b=XmW9eWDHkY18fa
	1Tu+O46jC7TVyzFKlsQ+RiEbp8F5YkT8Un3AGM/tVMWy999CYb3dln0KE1qAx43RR469PzCP5FP6m
	2R6pj12D15eSt9x7LF57GSU4CF0DGfpRM6UNeVTALTfoXRrTJam0LWLYVCkrG3WC/idTbZrD14/E9
	fO/HCJ04Z1ahp1R27DAecQhYHYU1PSmm7oj830auKMUZX/7pLs5F7lWiPEE0TrvUyD83hAc6Z286O
	Gbp/PYj2E4gePY5aU0es2yIdmJoW8fO5lS8j0tS4GgxFXucfeBsFnf30Lr6ABIUfsQLWNpmAhNNhL
	yZ5Fl7aZmNAfZ4KBffhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOS08-00000003dO1-0nEf;
	Fri, 20 Dec 2024 01:40:24 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tORyx-00000003cv2-2gcK
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 01:39:12 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-801d5add29eso935548a12.3
        for <kvm-riscv@lists.infradead.org>; Thu, 19 Dec 2024 17:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734658750; x=1735263550; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=OYKvlAfMuP2ktBfEDhDytfcvSdR/S4IqDZKQdTsYjuw=;
        b=iro4SV/QiKX63TCSjbkUp7eYtUPBAWAH2NZD0ThqJh4fgV7tofeBho6eCLSWjpwlt9
         ugvnuMey3Sg22+aVRJEdnOFhgqZA8xqyRk7bGGgCjHxesl1FDOMrAHBzmUU6Mx2tC2xD
         3KUlmO1PGsgNht404tdGiotnRGJIG/8gGhwYs4kYAmkuRjNGrNdK8U8dSsiidgsdgxdG
         9tScuJOfAIeBJxu8ZnctTOOrOoTUSpeeXFQqors98xQNwBKnxwKgk6JkEwavH3UNvJ0J
         5X0o0DNe0bL6ERu1ORjMPbNrAk7rH+tfSqAvaBBp9V9gl2fZsUp2Qh3kyErqx1DdoqS6
         /GGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734658750; x=1735263550;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYKvlAfMuP2ktBfEDhDytfcvSdR/S4IqDZKQdTsYjuw=;
        b=gC2sj6gTYaYQVJhAi8rZiRNGpxVRl98viqNiEnsdP0n42Zw6PeXlo2fYZX5Vv4DTwg
         QiBdrYpP6A5ZP2Uh5GoX//qUT655Xmwz6JyH2zRhcXBcgg+n8dXzPQuzxsCB4h82Q1Y3
         DsVNrzLiazz+lb01IJAnGdAWWs311C5SBbiiWPtwRqRqeyPsH4Y6PtUBLLUm8eD3GBs6
         zFBcPq1FZbU1OmUPPrX7gQdOIOoQaWlyZLB/gN/GLIILuvgByhv4TAIuFFCfLYZiITKr
         jCrCcu3RBv/CU2QhSQYXNu0ZB0bDWn5t68FsU3BSPhQM77riYDZvYA9fzAfboUDxSw5B
         aodQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqlZjtuZfK9D2VHCqJm3kAdksRg7yg3+GEYsIyJz5/3vO24lIKxHKb8An+CfC8h7iSH3cwNb8c5SA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzLiqpSVseM6WfFBg5giIVv59T2Vj75cUKBmAp28W8BLibtpvbt
	3IfFVeDE5uuddLk4I81sw3RBWJg6wVgwTjAnz9E7oAFNMdk8mPme4LNQJEIPFcuh/OzCnl39nHf
	mCw==
X-Google-Smtp-Source: AGHT+IGntiLPaNNzeAfuu6/TEmKwPAvoTiJFX2SO6583j9CN5As5xvpXTmf/fSQgTUKQrOus8R97PMQPQe4=
X-Received: from pfbch14.prod.google.com ([2002:a05:6a00:288e:b0:727:3a40:52cd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3a85:b0:1e1:c8f5:19ee
 with SMTP id adf61e73a8af0-1e5e04945e8mr2117339637.25.1734658750347; Thu, 19
 Dec 2024 17:39:10 -0800 (PST)
Date: Thu, 19 Dec 2024 17:38:59 -0800
In-Reply-To: <20241220013906.3518334-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241220013906.3518334-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241220013906.3518334-2-seanjc@google.com>
Subject: [PATCH 1/8] KVM: selftests: Fix mostly theoretical leak of VM's
 binary stats FD
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_173911_686852_09C84A06 
X-CRM114-Status: GOOD (  10.52  )
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

When allocating and freeing a VM's cached binary stats info, check for a
NULL descriptor, not a '0' file descriptor, as '0' is a legal FD.  E.g. in
the unlikely scenario the kernel installs the stats FD at entry '0',
selftests would reallocate on the next __vm_get_stat() and/or fail to free
the stats in kvm_vm_free().

Fixes: 83f6e109f562 ("KVM: selftests: Cache binary stats metadata for duration of test")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 33fefeb3ca44..91d295ef5d02 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -749,7 +749,7 @@ void kvm_vm_free(struct kvm_vm *vmp)
 		return;
 
 	/* Free cached stats metadata and close FD */
-	if (vmp->stats_fd) {
+	if (vmp->stats_desc) {
 		free(vmp->stats_desc);
 		close(vmp->stats_fd);
 	}
@@ -2218,7 +2218,7 @@ void __vm_get_stat(struct kvm_vm *vm, const char *stat_name, uint64_t *data,
 	size_t size_desc;
 	int i;
 
-	if (!vm->stats_fd) {
+	if (!vm->stats_desc) {
 		vm->stats_fd = vm_get_stats_fd(vm);
 		read_stats_header(vm->stats_fd, &vm->stats_header);
 		vm->stats_desc = read_stats_descriptors(vm->stats_fd,
-- 
2.47.1.613.gc27f4b7a9f-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
