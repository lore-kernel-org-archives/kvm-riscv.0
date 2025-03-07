Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AB4C19F32
	for <kvm-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 08:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3mI8oSaeh218/5O7P2vafd1SX8DM3VZf7149WELXAKQ=; b=MzVrsme1jomfjh
	ofLoT/xbu7rqoJIQ2oncZNrKN/DD+Wth0x72vXfWcLRzBpcE0S0g+Rbh52AODrXE0DeqDeTnXUXyM
	6xBfNpquL67t0J7fb6KFHe78mNQAHNLJI5st/0vXZnNpihCOEUzWbOL5fpl/UNA0HTQIOBUaEHbNd
	Id7W82aLHRX9Ib4zbqfQn8S7h/EpzW+FYlnb0MPnd+mBtq/LiRpm0m84C0U49wjl33o0fi1uOXLeR
	0uZ1zOnjqeqZ6ixypSLtECnpQ4yXF++erNbTEQ2iVGAyhV0TxmM3NMSbDu19bkdzujzDTk48jbVPd
	6ZZiDmgfqRM8fjZ8IZdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTH8-0000000DasO-1bry;
	Fri, 07 Mar 2025 08:41:46 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTFP-0000000DaeO-1G8e
	for kvm-riscv@lists.infradead.org;
	Fri, 07 Mar 2025 08:40:01 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741336795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ot48F+Ve1vTrXZ61ljmBh73Pm4QJUyONFwUOGHruh9o=;
	b=uz4wq5yml4bmviCBIVS+qNlIPWdX8G0qk2oBudCA+96zNxBWVX0jW+ZZi+gq6jM9mau98n
	0ZmPooVKJ+98CB4Ir9+/pi/nNi95nj+HS4vXbSqKUlS/hSDdRCoDn/T9S+I1jVnPei45vX
	ksY713N+KzlansYB20ZNEc4DAy7hs74=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org
Cc: pbonzini@redhat.com,
	thuth@redhat.com,
	alexandru.elisei@arm.com,
	eric.auger@redhat.com,
	lvivier@redhat.com,
	frankja@linux.ibm.com,
	imbrenda@linux.ibm.com,
	nrb@linux.ibm.com
Subject: [kvm-unit-tests PATCH] Makefile: Use CFLAGS in cc-option
Date: Fri,  7 Mar 2025 09:39:53 +0100
Message-ID: <20250307083952.40999-2-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_004000_256633_7D47E373 
X-CRM114-Status: UNSURE (   8.06  )
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

When cross compiling with clang we need to specify the target in
CFLAGS and cc-option will fail to recognize target-specific options
without it. Add CFLAGS to the CC invocation in cc-option.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 78352fced9d4..9dc5d2234e2a 100644
--- a/Makefile
+++ b/Makefile
@@ -21,7 +21,7 @@ DESTDIR := $(PREFIX)/share/kvm-unit-tests/
 
 # cc-option
 # Usage: OP_CFLAGS+=$(call cc-option, -falign-functions=0, -malign-functions=0)
-cc-option = $(shell if $(CC) -Werror $(1) -S -o /dev/null -xc /dev/null \
+cc-option = $(shell if $(CC) $(CFLAGS) -Werror $(1) -S -o /dev/null -xc /dev/null \
               > /dev/null 2>&1; then echo "$(1)"; else echo "$(2)"; fi ;)
 
 libcflat := lib/libcflat.a
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
