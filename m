Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B49CC3600C
	for <kvm-riscv@archiver.kernel.org>; Thu,  3 Apr 2025 11:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HLja6KpgPWQQNiUIf3Q17GEycSpUsyygZYcH3BhcrkQ=; b=svxND2ZllTr21O
	HCrzxr3XCEeCRsvmtR3ZYsA5oP1CbCkSmKTggqe8IRgTUlejobbEuWui990u3PeNpDWe4l2zAK5P1
	T4BgYnX3sndGmGXFo0chkev1liZPwMdfjohxIRYD6O4wmaEB5BxBs18XHl0dWkWo+slTvpRGUv9dm
	JiI9mMYdMtjvi5CmXVVrfoIcwnhMgb3zwIVZLQ7Uy26z9ZImhkoXQqNmEE1Nat5vgV9PhocbeCIVh
	f974I8+e96kaZW13ixdSEUHtFdrEI10crVH8mvziLe1/T3z+nC0PpkOX7OaztqBlzvVtsB47hnI/2
	2jzFUKJQznaXtpG3dnlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ItB-00000008jRU-3TzB;
	Thu, 03 Apr 2025 11:37:41 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Int-00000008iRO-29Lw
	for kvm-riscv@lists.infradead.org;
	Thu, 03 Apr 2025 11:32:14 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-391324ef4a0so107934f8f.2
        for <kvm-riscv@lists.infradead.org>; Thu, 03 Apr 2025 04:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1743679931; x=1744284731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uzJLKlljfvfxPvPUZeysuKSPBVSnoaOxnTXwCnBbatE=;
        b=PrvxqRkQQnmzTOBKSVH2V+ljWYx10W08diu/1F0Iywp8fQF4c7ImAzZDTfiyrD8l5u
         yHadJlE7/8vY/rgeITGlH2/mmXqDTaI4BJdVCRhup87zY4K7EPNofvlDYYuysLoL5d8m
         iR+w/i2rtIr039iknonV1WNYDGz7LpHiPSbX7AimUCFHqgJER2pYbA8YuUtP8//yvtBt
         YP3Zhk3Go2Y6LmZl2zQ3UGCBJALSNfGFXiAoZd0L9M9xMI6AJqEI+xAk+1UtFrDS6mpb
         VRA/5Cni3R12br7iTCJWqmrbffleKR2jURzDR+f8QkiretTfhJJvlPSxljO9qkzV93eJ
         AE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743679931; x=1744284731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uzJLKlljfvfxPvPUZeysuKSPBVSnoaOxnTXwCnBbatE=;
        b=RSsX/dxvVzFQtA87hQ05HjS+jBV6euTmR7FWsx8iGtPirRdVgyNOfp6MrbVVgUNnSi
         YrE5dqZs+MxxbxYVONns9erKLlG/me0ijR5ZL9tFoTFTGwwK4qQRIo5gg8QqaALRdxiD
         LmQsxtaRNlkzN4WSYrQ9+jVhhJsggbM+JPRSiTu8tPjmJgmhnosF+qNnfxI/hhVRsEFE
         3XHQceQ3wXc3H2R/rP8y1l0XgptWgZlK4mW48jULCHTBAPyr+69wwYysHJJqQiSM22i+
         JkGU7Se8rKUFuM1Bz5kIF2TQRt9yiFI3ysD+CrtG6PxB2lgERAp1QdcIoXWzPW3cqzDB
         Jwdg==
X-Gm-Message-State: AOJu0YzXDzFxt2vM3y3+KT8bbHhZQJlOey1v3o+KapJo4cGiNI4UIq1O
	95W2nlFXIh2zsAGHB4DnBAVWiW4pq6w/Oxm2R8yxUSWFwshEuKxaR5CktvxRHWGBoX1vjkJrZKI
	g
X-Gm-Gg: ASbGncsO0rg3b1dP1gRoGV3DcrjgkmSnRpWiJw9VY9xnBuj6w419/fpJqdFv6G6A+wv
	3Rl1YFoAieQN35L2QfXJhrRofv/6d1Euhsgga/HTFTm1ct0LCWxjcMSYjTfb6rE+UAZJD/QB8ra
	BKr32WRPU+M+eDFZM6RXzYkDz1ReD1QunZ2tYDhwGPdStgCz81j6kPrFRtyqAF21LH3j5m5xGrp
	bkvVUxpnLlPmL29HIeIqDKm2jEzzoLS8BFiDIezqryvjThxxbCpFCBbikMcbJ+1EmrunC4mQUyj
	GvxjP8rIYoEcPfUwl4M+6cW2PWc4OUmcGjhYrJ565sIV5DJEufrW9IdCFeZHxJbPUPx9k3TIKcO
	rNg==
X-Google-Smtp-Source: AGHT+IH6xifwXMVfMLClIlm2BzAh7GveRJDcwc65VzrAXzSC6fsdF3OjurjTLfO2TtkYTUXlVLDtBQ==
X-Received: by 2002:a5d:64e9:0:b0:391:2a9a:47a6 with SMTP id ffacd0b85a97d-39c120db3demr6114098f8f.4.1743679931180;
        Thu, 03 Apr 2025 04:32:11 -0700 (PDT)
Received: from localhost (cst2-173-141.cust.vodafone.cz. [31.30.173.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec3669d0fsm15884455e9.36.2025.04.03.04.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 04:32:10 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: kvm-riscv@lists.infradead.org
Cc: kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [PATCH 0/5] KVM: RISC-V: VCPU reset fixes
Date: Thu,  3 Apr 2025 13:25:19 +0200
Message-ID: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_043213_554962_F47E28B1 
X-CRM114-Status: GOOD (  14.22  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgp0aGlzIHNlcmllcyBzdGFydGVkIHdpdGggYSBzaW1wbGUgZml4IFs1LzVdLCB3aGlj
aCBzYWRseSBkaWRuJ3QgZml4CmVub3VnaCB3aXRob3V0IFs0LzVdLiAgWzEtMy81XSBhcmUgcmVm
YWN0b3JzIHRvIG1ha2UgdGhlIHJlc2V0IGEgYml0CmVhc2llciB0byBmb2xsb3cuICAoWzEtMyw1
LzVdIGFyZSBhcHBsaWNhYmxlIHdpdGhvdXQgWzQvNV0uKQoKWzQvNV0gY2hhbmdlcyB0aGUgdXNl
cnNwYWNlIEFCSSBhbmQgSSdkIGxpa2UgdG8gZ2F0aGVyIHlvdXIgb3BpbmlvbnMgb24KaG93IHRo
ZSBBQkkgaXMgc3VwcG9zZWQgdG8gd29yay4KCkFzIGFub3RoZXIgcHJvcG9zYWwsIHdoYXQgZG8g
eW91IHRoaW5rIGFib3V0IGFuIElPQ1RMIHRoYXQgYWxsb3dzCnVzZXJzcGFjZSB0byBpbnZva2Ug
YW55IEtWTSBTQkkgZWNhbGw/ClVzZXJzcGFjZSBjb3VsZCBjYWxsIHRoZSBLVk0gSFNNIGltcGxl
bWVudGF0aW9uIHRvIHJlc2V0IGFuZCBzdGFydCBhClZDUFUsIGJ1dCBJIHRoaW5rIHRoYXQga3Zt
X21wX3N0YXRlIGlzIGFuIFNCSSBIU00gaW50ZXJmYWNlLCBzbyB3ZSBoYXZlCmFuIG9ic2N1cmUg
SU9DVEwgZm9yIGl0IGFscmVhZHkuCkkgd2FzIGFsc28gdGhpbmtpbmcgYWJvdXQgdXNpbmcgS1ZN
X01QX1NUQVRFX1VOSU5JVElBTElaRUQgdG8KZGlzdGluZ3Vpc2ggdGhhdCBLVk0gc2hvdWxkIHJl
c2V0IHRoZSBzdGF0ZSB3aGVuIGJlY29taW5nIHJ1bm5hYmxlLgoKSSByZWNvbW1lbmQgdG8gc3Rh
cnQgd2l0aCB0aGUgZm9sbG93aW5nIGh1bmsgaW4gWzQvNV0sIGFzIGl0J3MgdGhlIG9ubHkKc2ln
bmlmaWNhbnQgcGFydCBvZiB0aGlzIHNlcmllczoKCiAgQEAgLTUyMCw2ICs1MjUsMTAgQEAgaW50
IGt2bV9hcmNoX3ZjcHVfaW9jdGxfc2V0X21wc3RhdGUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAog
ICAKICAgCXN3aXRjaCAobXBfc3RhdGUtPm1wX3N0YXRlKSB7CiAgIAljYXNlIEtWTV9NUF9TVEFU
RV9SVU5OQUJMRToKICArCQlpZiAocmlzY3ZfdmNwdV9zdXBwb3J0c19zYmlfZXh0KHZjcHUsIEtW
TV9SSVNDVl9TQklfRVhUX0hTTSkgJiYKICArCQkJCXZjcHUtPmFyY2gucmFuX2F0bGVhc3Rfb25j
ZSAmJgogICsJCQkJa3ZtX3Jpc2N2X3ZjcHVfc3RvcHBlZCh2Y3B1KSkKICArCQkJa3ZtX3Jpc2N2
X3ZjcHVfc2JpX3JlcXVlc3RfcmVzZXRfZnJvbV91c2Vyc3BhY2UodmNwdSk7CgpUaGFua3MuCgpS
YWRpbSBLcsSNbcOhxZkgKDUpOgogIEtWTTogUklTQy1WOiByZWZhY3RvciB2ZWN0b3Igc3RhdGUg
cmVzZXQKICBLVk06IFJJU0MtVjogcmVmYWN0b3Igc2JpIHJlc2V0IHJlcXVlc3QKICBLVk06IFJJ
U0MtVjogcmVtb3ZlIHVubmVjZXNzYXJ5IFNCSSByZXNldCBzdGF0ZQogIEtWTTogUklTQy1WOiBy
ZXNldCBWQ1BVIHN0YXRlIHdoZW4gYmVjb21pbmcgcnVubmFibGUKICBLVk06IFJJU0MtVjogcmVz
ZXQgc21zdGF0ZWVuIENTUnMKCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9haWEuaCAgICAg
ICAgIHwgIDMgLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCAgICAgICAgfCAx
MyArKystLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaCAgICB8ICA1ICsr
CiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3ZlY3Rvci5oIHwgIDYgKy0tCiBhcmNo
L3Jpc2N2L2t2bS9haWFfZGV2aWNlLmMgICAgICAgICAgICAgIHwgIDQgKy0KIGFyY2gvcmlzY3Yv
a3ZtL3ZjcHUuYyAgICAgICAgICAgICAgICAgICAgfCA2OSArKysrKysrKysrKysrKystLS0tLS0t
LS0KIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMgICAgICAgICAgICAgICAgfCAyOCArKysrKysr
KysrCiBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9oc20uYyAgICAgICAgICAgIHwgMTMgKy0tLS0K
IGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3N5c3RlbS5jICAgICAgICAgfCAxMCArLS0tCiBhcmNo
L3Jpc2N2L2t2bS92Y3B1X3ZlY3Rvci5jICAgICAgICAgICAgIHwgMTMgKystLS0KIDEwIGZpbGVz
IGNoYW5nZWQsIDk3IGluc2VydGlvbnMoKyksIDY3IGRlbGV0aW9ucygtKQoKLS0gCjIuNDguMQoK
Ci0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
