Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C703CCD6E49
	for <kvm-riscv@archiver.kernel.org>; Fri, 29 May 2026 06:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7wQPP3270cPeQmGBwh0Bq2B16XzKjFVOvagKmwZ+bZQ=; b=4NJ8ORZRItDGIV
	+J4mqTOHc1pVIiNBLzTXKFBoNoFIYlU/iocs1nqNrdIxjygpFw0VUn6LfXtG6eZKoTnc1VWSW79un
	f7Kr+JeNUIMFnC8pNunnP5gTVcCCf4de0gSz1h0hoJZLhwGRF9hg6ur95XiEaz6v9LLEKmayF4Wz2
	vgCw0CnMhzcQJxzShx+9qw7i5ku6uHzV4h5VzL0zbgyqEyZ08Gb7xKfh8FcyVRxDu+xyq5ujKB+x3
	YRpFLE4dNo7K07SOjOdNX/Q8j1p8nA9SQ6D5pXPRSOBqeoW4L/7Z6Sb18BY5kXuP3rzPI8o803oFt
	n+nrYleScMVwzAx1PjPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqi6-00000006oAp-41th;
	Fri, 29 May 2026 06:28:46 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqi4-00000006o95-1Kdb
	for kvm-riscv@lists.infradead.org;
	Fri, 29 May 2026 06:28:45 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-304d555293aso124763eec.0
        for <kvm-riscv@lists.infradead.org>; Thu, 28 May 2026 23:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1780036123; x=1780640923; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yc3+Um0q/cLzforp36o+SIYNj+jJ+pe+LLCc2WA5hpM=;
        b=Y2qe0jX8PqrI5KuAb5EUMuVmWbR1E84851ET1vGFXdEe7KdSXB9lUzjTDhp6gwwXFC
         v1H5KfyXTD2KcSxKX0MznV5SanZB/MhSj/PdQ/Ipsyz7bMvfN8/LWPpTp+R9NXnqjiuP
         lL/6C9ztmtGUVxB9AzMmDuMDOKW62Dd55Bv9qQBG+2qspNA6sIcTHFymLMAF3pDjt06p
         SlykCKr8thJA8rN6zeqRlIhFGnCzeThoK6ABJM8pVFkv9i9t70n4AB77rwqthqioEnVi
         fuNXjXgjOs6HR3dARYCDpgpPysSuJpqYx4hIXwpIdq74Z3X8hMUQEBNfmx9FPkR5rLQV
         YLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780036123; x=1780640923;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yc3+Um0q/cLzforp36o+SIYNj+jJ+pe+LLCc2WA5hpM=;
        b=WLKOAmZDzVGmWkbxNZa9Lm/ZlyTkkyN/LUT4CUqUlNGyhQQWlcR+1ZIz3jh9wzotWt
         x9vseRfujwnl6xZrs86dWT+f+rp6dyu0i1bdo5umO3/bZzJ8jPPr6fPXN6s75qoiNvrp
         f5JtkxXdNhsxTIwyajxJYTqDmoLC/WQl3HaPgfQZpt7BdvnTxU5BlRXONV1Plq4xvEsd
         HcfkuZvdVssmPABoK/Huq0ZTKsStpdbX0BYd3Bo3ji70ZmlX+/kkcAtaGfvQGeQ9GyWN
         M/IA73YjP2VoEwJAIeik5wv6CJQoAjmpYOEsEPwwysXAA3zz+wepO7CLGR92v1+6BmB0
         obGg==
X-Forwarded-Encrypted: i=1; AFNElJ9ByuKHImeKPVlN65erdmeztFCu4yT0MglSD8HIr0z8vuwUuI4gg9GKlNN9ExU2u4F42f9wr8bi7XM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyFMZezR4g7THMy73yVYv9CQg3wn0Us++7dZv/xKTrqyRJLwOCR
	lqKRRxCYlviREsGSdplhqY5p34S2bQSF5Ct0BavSXdU0abz1K4vqcOpTk6Ihn/piqVs=
X-Gm-Gg: Acq92OHEn9P4HDboewWnnKK2r/64Og1po/3VoudGV3ks0khfLsF76XThhdLCOzix2vR
	Kx8D45UQM4GcFTNoNBEmA0SMbyHxo8R1/XZc1FmbKbRAB5S0YBNoYSv+YuL7HjqoFeeIvUd9Aao
	O2RFaRXyv/tAjSyRWZMItDZuY8VX84vkdMeX8EOF0TcebPlbHSzfgw9jJefEeTn/yfk7Um7mddl
	2Rcq0u2iSze95YTG6l3VLbGL0hpld1pf6Q2SzsO/fi5JxW0/AJZJ3PDn/PLD6elijuNk07UrMb0
	4eZoA/eqWJsfbUlVRn7rKmudy7m2jECb+h6zUQRWktVSz+lg+RyVG/cdcY8spu67kDbf7dcLjsw
	gSiNO9h9eOsUF2EDGsCLABRqQ0MO6EZTMKsDG43RpdoBCSF5V1awT1JfIR1zrzanBksB0VnBLTw
	mjht3UEtKd4CSvJ0p1F1ueSVTKHafSR228eXzbK93RYsYSPRi/gssAWA==
X-Received: by 2002:a05:7301:3f16:b0:304:8366:7456 with SMTP id 5a478bee46e88-304eb0f0b91mr881488eec.3.1780036123025;
        Thu, 28 May 2026 23:28:43 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed3358b1sm694607eec.13.2026.05.28.23.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 23:28:42 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v3 0/3] KVM: riscv: add check_supported_reg() into
 get-reg-list test
Date: Thu, 28 May 2026 23:28:26 -0700
Message-Id: <20260528-kvm-get_reg_list-v2-v3-0-170969a8599f@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAoyGWoC/32NQQ6CMBREr0L+2ppSSg2uvIchpNbf8lXAtNhoS
 O9uwb3JbF4yb2aBgJ4wwLFYwGOkQNOYodoVYHo9OmR0zQyCC8Vrodg9Dszh3Hl03YPCzKJgtrG
 ValSpjTKQzadHS+9t9dz+OLwuNzTzOrU2+mxO/rPdRrH2/j/kcHZoJNeSl7KW+hTIUsS9mQZoU
 0pfK5R+F8kAAAA=
X-Change-ID: 20260526-kvm-get_reg_list-v2-f9f36961ac6c
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780036122; l=2682;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=VBg6eYh18X5PDnPO9DIhzM31fE7SG2D5HIs6cG6KOkA=;
 b=WZoiBediPqeVKPQUkdFvp7yI3jn8I3iTjYJoIKq4mGWSe2Kp/W2UGojEd5uTJ0uuEmyPqLRcj
 7rI61rm9xdwBJrDzyxmPQWX4j2oJx3ZKHkGz5kt7Z7XalBAlPFk0bj0
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_232844_377016_0FC45216 
X-CRM114-Status: UNSURE (   7.68  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

VGhpcyBzZXJpZXMgYWRkcmVzc2VzIGEgYnVnIGluIHRoZSBTQkkgRldGVCAoRmlybXdhcmUgRmVh
dHVyZXMpIGV4dGVuc2lvbgp3aGVyZSBmZWF0dXJlcyBjb3VsZCByZW1haW4gZXhwb3NlZCB0byBn
dWVzdHMgYWZ0ZXIgdGhlaXIgZGVwZW5kZW50IElTQQpleHRlbnNpb25zIGFyZSBkaXNhYmxlZCBh
dCBydW50aW1lLCBhbmQgaW1wcm92ZXMgdGhlIHJlbGF0ZWQgc2VsZnRlc3QKaW5mcmFzdHJ1Y3R1
cmUuCgpUaGUgYnVnIChwYXRjaCAxKSBvY2N1cnJlZCBiZWNhdXNlIEZXRlQgZmVhdHVyZSBzdXBw
b3J0IHdhcyBjYWNoZWQgYXQgdkNQVQppbml0aWFsaXphdGlvbiB0aW1lLiBXaGVuIHVzZXJzcGFj
ZSBzdWJzZXF1ZW50bHkgZGlzYWJsZWQgSVNBIGV4dGVuc2lvbnMKdmlhIEtWTSBPTkVfUkVHLCB0
aGUgY2FjaGVkIHN1cHBvcnQgc3RhdHVzIHdhcyBub3QgdXBkYXRlZCwgbGVhZGluZyB0bwpzdGFs
ZSBmZWF0dXJlIGV4cG9zdXJlLgoKVGhlIHNlbGZ0ZXN0IGltcHJvdmVtZW50cyAocGF0Y2hlcyAy
LTMpIGVuaGFuY2UgdGhlIGdldC1yZWctbGlzdCB0ZXN0IGJ5CnJlZmFjdG9yaW5nIHRoZSBleHRl
bnNpb24gc3VibGlzdCBpbmZyYXN0cnVjdHVyZSBhbmQgc3BsaXR0aW5nIEZXRlQKZmVhdHVyZSB0
ZXN0aW5nIGludG8gc2VwYXJhdGUsIHByb3Blcmx5LWdhdGVkIHN1Ymxpc3RzLgoKLS0tCkNoYW5n
ZXMgaW4gdjM6Ci0gUmVzdG9yZSAnc3VwcG9ydGVkJyBmaWVsZCB3aXRoIGluaXQoKSBjYWxsYmFj
ayBmb3IgaW5pdGlhbGl6YXRpb24gcHJvYmluZwogIChzYXNoaWtvLWJvdCkKLSBBZGQgTlVMTCBj
aGVja3MgYmVmb3JlIGNhbGxpbmcgZmVhdHVyZS0+c3VwcG9ydGVkKCkgaW4gYWxsIGZ1bmN0aW9u
cwotIEZpeCBpc2FfZXh0X2VuYWJsZWQgdHJhY2tpbmcgbG9naWMgYW5kIHJlc3RvcmUgaXNhX2V4
dF9jYW50X2Rpc2FibGUgYXJyYXkKLSBBZGQgc2JpX2V4dF9lbmFibGVkIHRyYWNraW5nIGFuZCBl
bmhhbmNlIGRlcGVuZGVuY3kgY2hlY2tpbmcgKHNhc2hpa28tYm90KQotIFJlZmluZSBjb2RlIG9y
Z2FuaXphdGlvbiBhbmQgdmFyaWFibGUgbmFtaW5nIGNvbnNpc3RlbmN5IChzYXNoaWtvLWJvdCkK
LSBMaW5rIHRvIHYyOiBodHRwczovL3BhdGNoLm1zZ2lkLmxpbmsvMjAyNjA1MjYta3ZtLWdldF9y
ZWdfbGlzdC12Mi12Mi0wLTc5NDBhNDAxNDU0YUBzaWZpdmUuY29tCgpDaGFuZ2VzIGluIHYyOgot
IEZpeCBGV0ZUIHN0YWxlIGZlYXR1cmUgZXhwb3N1cmUgYnkgcmVtb3Zpbmcgc3RhdGljICdzdXBw
b3J0ZWQnIGZpZWxkCi0gUmVmYWN0b3IgZ2V0LXJlZy1saXN0IHRlc3QgdG8gdXNlIHVuaWZpZWQg
ZXh0ZW5zaW9uIHN1Ymxpc3QgbWFjcm9zCi0gU3BsaXQgRldGVCB0ZXN0aW5nIGludG8gcGVyLWZl
YXR1cmUgc3VibGlzdHMgd2l0aCBydW50aW1lIGNoZWNrcwogIChBbmRyZXcpCgpUbzogQW51cCBQ
YXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KVG86IEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUBs
aW51eC5kZXY+ClRvOiBQYXVsIFdhbG1zbGV5IDxwandAa2VybmVsLm9yZz4KVG86IFBhbG1lciBE
YWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+ClRvOiBBbGJlcnQgT3UgPGFvdUBlZWNzLmJlcmtl
bGV5LmVkdT4KVG86IEFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0aS5mcj4KVG86IENsw6ltZW50
IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KVG86IEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+ClRvOiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgpU
bzogU2h1YWggS2hhbiA8c2h1YWhAa2VybmVsLm9yZz4KQ2M6IGdyZWVudGltZS5odUBzaWZpdmUu
Y29tCkNjOiB2aW5jZW50LmNoZW5Ac2lmaXZlLmNvbQpDYzogem9uZy5saUBzaWZpdmUuY29tCkNj
OiBrdm1Admdlci5rZXJuZWwub3JnCkNjOiBrdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpD
YzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZwpDYzogbGludXgta3NlbGZ0ZXN0QHZnZXIua2VybmVsLm9yZwoKLS0tCllvbmct
WHVhbiBXYW5nICgzKToKICAgICAgS1ZNOiBSSVNDLVY6IFNCSSBGV0ZUOiBGaXggc3RhbGUgZmVh
dHVyZSBleHBvc3VyZSBhZnRlciBydW50aW1lIGV4dGVuc2lvbiBjaGFuZ2VzCiAgICAgIEtWTTog
cmlzY3Y6IHNlbGZ0ZXN0czogUmVmYWN0b3IgSVNBIGFuZCBTQkkgZXh0ZW5zaW9uIHN1Ymxpc3Qg
bWFjcm9zCiAgICAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogU3BsaXQgU0JJIEZXRlQgaW50byBz
ZXBhcmF0ZSBmZWF0dXJlLXNwZWNpZmljIHN1Ymxpc3RzCgogYXJjaC9yaXNjdi9rdm0vdmNwdV9z
YmlfZndmdC5jICAgICAgICAgICAgICAgICAgIHwgIDMyICsrKystCiB0b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMgfCAxNjggKysrKysrKysrKysrKysrLS0t
LS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTQwIGluc2VydGlvbnMoKyksIDYwIGRlbGV0aW9ucygt
KQotLS0KYmFzZS1jb21taXQ6IGM3ODMyNTM0YTgxNjAyNzZjY2NiOWE4Y2M4Y2FmYjU2MTRjNTc5
ZDAKY2hhbmdlLWlkOiAyMDI2MDUyNi1rdm0tZ2V0X3JlZ19saXN0LXYyLWY5ZjM2OTYxYWM2YwoK
Ci0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
