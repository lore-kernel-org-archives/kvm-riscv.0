Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287A1CD6E56
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 10:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=66bk9I0iHlGamNefq+Xxdb4pydrCg5QZBaYyr5iRaz4=; b=Idl+20YEGY4WTH
	80Vy3s6GRXlp4Ja8DaU52kCt1nSLTT8i+ohWxBme65ANX+hG7RDXdg9RRFlzyjqrTAP1+18tM8btQ
	Am1w6Idd3Nha+XxYjQKCEpzH9VejVBVigEiuMvRJWNH8UmdRLNz3IgyiLre/FhBDKxUDhK/ptOt01
	9SUv24OrjgcpW4J8oVf04DKlx10cAEne/v/g3fsTY9qksVT3IJUB5AG4ftYq9wdgpbjIfCLaisLUM
	5pQg0e1Zk1PgcirvJAS3xfd3Gv6LTi0WjMBpI2DaLwMMaUGDvIRb8Myh2q7kdeCA7wY6vvfj7egq6
	PEirVbZB9effYBc38U7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzqw-0000000Ac2h-2aLr;
	Mon, 01 Jun 2026 10:26:38 +0000
Received: from mail-dy1-f170.google.com ([74.125.82.170])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzqt-0000000Ac1G-07pO
	for kvm-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 10:26:36 +0000
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304e58292d3so6285159eec.0
        for <kvm-riscv@lists.infradead.org>; Mon, 01 Jun 2026 03:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1780309594; x=1780914394; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w+2YxV+6v8HxHah8ejk5xIUKcFmR0bUuiOdbEsVMnZo=;
        b=WTykt6RO++OsiRusoIffOfshVNtvjRdLIqUdop4QT116WUsf4/e2H0T0Nck0mb5ssR
         SBqwAQFVCtg5zQMnIuTg5tiWIi/bvc1VHGFMZUqFz/wr6j6tNhp2gHtE+Jt+3CTXqdSm
         IkSoE4F8ZlvOLYlimRSEK1yb527z6Nxkx1nHqLO22NYise9xteHlZv0QIbyu6WPHbtBI
         1OT7BZB5Ok3nHSDW5apmK9ErsEsXpD1iNZzKTFZHBoFKVNhKuXFn2sG8q9D3P/yRqNd/
         /d5IQDPWr93bBgnXbaYZB9QFeyNJNCe9G/j/Cm3r/TUji7APGZQTnylKabK7ju/ppLZe
         QU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780309594; x=1780914394;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+2YxV+6v8HxHah8ejk5xIUKcFmR0bUuiOdbEsVMnZo=;
        b=LAjnySXnJRXFxclzmhbzxRelLNrSRjZ4SvoHJ5aLMxGbWZlwzpe+XQWXn7yjffjrc+
         aG5jdGNHVA5WRl7Kjlm+SN5ngIMPl8se5jS6cMPrPQxKrEq/ZPIxn5gIysUVrIdhbCCZ
         w5EcajCKAvJe2RLyk4cMcL5DIPCMmfE2KNvs7h3pDEUWFcjJUCxSvOVFQpGmC88pbxW9
         SdUABaQO6kl/Y8nd3dGKYDVsoJzvlvvIkKClvMWL2a0pvI9mFC6LNvg96o3W3LMvbjvR
         m9njxIW1q1VDVJY9M28wKpH60WajcGn3rwXUt7YwYJaevUFIWwEA559t+ZMifyalnTB5
         3MXw==
X-Forwarded-Encrypted: i=1; AFNElJ/ZV26mDOXgRsAt7OaP7aDwAumACE9R/PEeBWTKlfoOAsOaaSn7QClJs2O7qDVFPtK/Q0J9guvINH0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo/nqiUaXS82z4ecnPAdyx2ig+ON2TgHopmW6gUJOf77wVkEWO
	T/+KCtaqYLhFnlnieHq/KnAECBXWuunEq6Qd9tV04md6wUcG7uEJK/ieAyoLWJStAPo=
X-Gm-Gg: Acq92OEszUea11LiAthXT/bBKnCik1EBXGHHlnYdRoF6fvGNgS/vKFJNAfiTUcIPDhH
	hrsjv9NUOv+flHKg0hcoPOc7T2cAcMdhNJa5a9Mz2IYrQU0p+MVE9UkFopN52ZC18J73ZX7dUPr
	+zLNYZVn+Wnc54EggQt0Ci6nk5/TOKdlAaUlOMVCX4YIRH5kBgsuTTgwD6wHV5vrpCdpBFU2Jjk
	eqew3t1y98i+jsvpAfYQbC2IYYFyUIVINrbYQViCRQSyJu9eqj2h1BPpEFe+Nxcrr4ey09XoLs2
	qNYEl3SjNsnfsR2YvqLoFBD0oIAGeKcSwBxBnSFsZpu+f9s3H7B0b2XPPi4XBdcKR+E+Bo4aJRk
	3DKdIgl8l+iiH08bLBfGEXkhINWj0ULXCGPllRIDzQIWU9T8Aj9fuYycbdf4m37N5rEAVthm6Ht
	DzntpLttDSB7fKc3ZnqplY3SOz4adZXBtZR+V5XpMfTjxvvqWw932Uwg==
X-Received: by 2002:a05:7300:6d21:b0:304:188d:d0be with SMTP id 5a478bee46e88-304fa674743mr5259150eec.16.1780309593836;
        Mon, 01 Jun 2026 03:26:33 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed5b9be7sm8176001eec.27.2026.06.01.03.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 03:26:33 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v5 0/5] KVM: riscv: Fix stale FWFT feature exposure and
 enhance selftests
Date: Mon, 01 Jun 2026 03:26:21 -0700
Message-Id: <20260601-kvm-get_reg_list-v2-v5-0-415d08a2813b@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAE1eHWoC/33OTQ7CIBAF4Ks0rMUApQiuvIcxDaVDi381UImm6
 d2ldaFGYzKbl8x8bwYUwDsIaJ0NyEN0wXXnFIpFhkyrzw1gV6eMGGGCFEzgQzzhBvrSQ1MeXeh
 xZNgqmwslqDbCoHR58WDdbVa3u2cO12oPpp+oaaNNl52/z7WRTXv/G9IQvFKcaE4oL7jeBGddh
 KXpTmiqiPk7In8jeULoiiihtCyUsl8IfyGC0N8IT4iRUldGUqjqz0/GcXwA5nx8slMBAAA=
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
 linux-kselftest@vger.kernel.org, inochiama@gmail.com, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780309592; l=3974;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=i22xps6LCObUD2kqUTEDbNF8C3JLN3ZsednxQoPzcsw=;
 b=wdJr7Ln1xzni8KnSJ57h+PPvQD5PuXrTrrX5ZA4mQYHmh+QPZPvxnYPYi+lb2+zyAgaCjKJRl
 lN/F+1MpxnlB2jG6KWSp0moShK6wfjKHRsHXLH+It30jxPYAzrEpTN0
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_032635_069718_9CFF0750 
X-CRM114-Status: UNSURE (   9.73  )
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

VGhpcyBzZXJpZXMgZml4ZXMgdGhyZWUgYnVncyBpbiB0aGUgU0JJIEZXRlQgKEZpcm13YXJlIEZl
YXR1cmVzKSBleHRlbnNpb24KYW5kIGltcHJvdmVzIHRoZSByZWxhdGVkIHNlbGZ0ZXN0IGluZnJh
c3RydWN0dXJlLgpUaGUgYnVncyBhcmU6CjEuIE1pc3NpbmcgQ1NSIGRpcnR5IG1hcmtpbmc6IFdo
ZW4gdXNlcnNwYWNlIHNldHMgRldGVCBmZWF0dXJlIHZhbHVlcyB2aWEKICAgS1ZNX1NFVF9PTkVf
UkVHLCBtb2RpZmllZCBDU1JzIChlLmcuLCBoZW52Y2ZnLlBNTSBmb3IgcG9pbnRlciBtYXNraW5n
KQogICBhcmUgbm90IG1hcmtlZCBkaXJ0eSwgbGVhZGluZyB0byBzdGFsZSBzdGF0ZSBhZnRlciB2
Q1BVIHNjaGVkdWxpbmcgb3IKICAgbWlncmF0aW9uLgoyLiBIYXJkd2FyZSBwcm9iaW5nIHNpZGUg
ZWZmZWN0czogVGhlIHRyeV90b19zZXRfcG1tKCkgZnVuY3Rpb24gbW9kaWZpZXMKICAgSEVOVkNG
Ry5QTU0gZHVyaW5nIGhhcmR3YXJlIGNhcGFiaWxpdHkgZGV0ZWN0aW9uIGJ1dCBmYWlscyB0byBy
ZXN0b3JlCiAgIHRoZSBvcmlnaW5hbCB2YWx1ZSwgbGVhdmluZyB0aGUgQ1NSIGluIGFuIGFsdGVy
ZWQgc3RhdGUgdGhhdCBhZmZlY3RzCiAgIHN1YnNlcXVlbnQgb3BlcmF0aW9ucy4KMy4gU3RhbGUg
ZmVhdHVyZSBleHBvc3VyZTogRldGVCBmZWF0dXJlIHN1cHBvcnQgaXMgY2FjaGVkIGF0IHZDUFUK
ICAgaW5pdGlhbGl6YXRpb24gdGltZS4gV2hlbiB1c2Vyc3BhY2Ugc3Vic2VxdWVudGx5IGRpc2Fi
bGVzIElTQSBleHRlbnNpb25zCiAgIHZpYSBLVk1fU0VUX09ORV9SRUcsIHRoZSBjYWNoZWQgc3Vw
cG9ydCBzdGF0dXMgaXMgbm90IHVwZGF0ZWQsIGFsbG93aW5nCiAgIGd1ZXN0cyB0byBhY2Nlc3Mg
ZmVhdHVyZXMgdGhhdCBkZXBlbmQgb24gZGlzYWJsZWQgZXh0ZW5zaW9ucy4KUGF0Y2hlcyAxLTMg
Zml4IHRoZXNlIGJ1Z3Mgc2VwYXJhdGVseS4KClRoZSBzZWxmdGVzdCBpbXByb3ZlbWVudHMgKHBh
dGNoZXMgNC01KSBlbmhhbmNlIHRoZSBnZXQtcmVnLWxpc3QgdGVzdCBieQpyZWZhY3RvcmluZyB0
aGUgZXh0ZW5zaW9uIHN1Ymxpc3QgaW5mcmFzdHJ1Y3R1cmUgYW5kIHNwbGl0dGluZyBGV0ZUCmZl
YXR1cmUgdGVzdGluZyBpbnRvIHNlcGFyYXRlLCBwcm9wZXJseS1nYXRlZCBzdWJsaXN0cy4KCi0t
LQpDaGFuZ2VzIGluIHY1OgotIEFkZCBDU1IgZGlydHkgbWFya2luZyBmaXggKG5ldyBwYXRjaCAx
LzUpIChzYXNoaWtvLWJvdCkKLSBTcGxpdCBvcmlnaW5hbCBGV0ZUIGJ1ZyBmaXggaW50byB0d28g
Zm9jdXNlZCBwYXRjaGVzCiAgLSBBZGQgaW5pdCgpIGNhbGxiYWNrIHdpdGggdHJ5X3RvX3NldF9w
bW0oKSByZXN0b3JhdGlvbiBmaXggKG5ldyBwYXRjaAogICAgMi81KSAoc2FzaGlrby1ib3QpCiAg
LSBLZWVwIHJ1bnRpbWUgc3VwcG9ydGVkKCkgY2hlY2tzIGFzIHNlcGFyYXRlIHBhdGNoIChwYXRj
aCAzLzUpCi0gTGluayB0byB2NDogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYwNjAxLWt2
bS1nZXRfcmVnX2xpc3QtdjItdjQtMC1jODhhYmM4MWViZGFAc2lmaXZlLmNvbQoKQ2hhbmdlcyBp
biB2NDoKLSBSZW5hbWUgdGhlIHRpdGxlIG9mIGNvdmVyIGxldHRlcgotIERpc2FibGUgcHJlZW1w
dGlvbiB3aGVuIHJ1bm5pbmcgdHJ5X3RvX3NldF9wbW0oKSAoc2FzaGlrby1ib3QpCi0gUmVtb3Zl
IGNoZWNrX3N1cHBvcnRlZF9yZWcoKSAoc2FzaGlrby1ib3QpCi0gTGluayB0byB2MzogaHR0cHM6
Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYwNTI4LWt2bS1nZXRfcmVnX2xpc3QtdjItdjMtMC0xNzA5
NjlhODU5OWZAc2lmaXZlLmNvbQoKQ2hhbmdlcyBpbiB2MzoKLSBSZXN0b3JlICdzdXBwb3J0ZWQn
IGZpZWxkIHdpdGggaW5pdCgpIGNhbGxiYWNrIGZvciBpbml0aWFsaXphdGlvbiBwcm9iaW5nCiAg
KHNhc2hpa28tYm90KQotIEFkZCBOVUxMIGNoZWNrcyBiZWZvcmUgY2FsbGluZyBmZWF0dXJlLT5z
dXBwb3J0ZWQoKSBpbiBhbGwgZnVuY3Rpb25zCi0gRml4IGlzYV9leHRfZW5hYmxlZCB0cmFja2lu
ZyBsb2dpYyBhbmQgcmVzdG9yZSBpc2FfZXh0X2NhbnRfZGlzYWJsZSBhcnJheQotIEFkZCBzYmlf
ZXh0X2VuYWJsZWQgdHJhY2tpbmcgYW5kIGVuaGFuY2UgZGVwZW5kZW5jeSBjaGVja2luZyAoc2Fz
aGlrby1ib3QpCi0gUmVmaW5lIGNvZGUgb3JnYW5pemF0aW9uIGFuZCB2YXJpYWJsZSBuYW1pbmcg
Y29uc2lzdGVuY3kgKHNhc2hpa28tYm90KQotIExpbmsgdG8gdjI6IGh0dHBzOi8vcGF0Y2gubXNn
aWQubGluay8yMDI2MDUyNi1rdm0tZ2V0X3JlZ19saXN0LXYyLXYyLTAtNzk0MGE0MDE0NTRhQHNp
Zml2ZS5jb20KCkNoYW5nZXMgaW4gdjI6Ci0gRml4IEZXRlQgc3RhbGUgZmVhdHVyZSBleHBvc3Vy
ZSBieSByZW1vdmluZyBzdGF0aWMgJ3N1cHBvcnRlZCcgZmllbGQKLSBSZWZhY3RvciBnZXQtcmVn
LWxpc3QgdGVzdCB0byB1c2UgdW5pZmllZCBleHRlbnNpb24gc3VibGlzdCBtYWNyb3MKLSBTcGxp
dCBGV0ZUIHRlc3RpbmcgaW50byBwZXItZmVhdHVyZSBzdWJsaXN0cyB3aXRoIHJ1bnRpbWUgY2hl
Y2tzCiAgKEFuZHJldykKClRvOiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgpUbzog
QXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQGxpbnV4LmRldj4KVG86IFBhdWwgV2FsbXNsZXkgPHBq
d0BrZXJuZWwub3JnPgpUbzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KVG86
IEFsYmVydCBPdSA8YW91QGVlY3MuYmVya2VsZXkuZWR1PgpUbzogQWxleGFuZHJlIEdoaXRpIDxh
bGV4QGdoaXRpLmZyPgpUbzogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpU
bzogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KVG86IFBhb2xvIEJvbnpp
bmkgPHBib256aW5pQHJlZGhhdC5jb20+ClRvOiBTaHVhaCBLaGFuIDxzaHVhaEBrZXJuZWwub3Jn
PgpDYzogZ3JlZW50aW1lLmh1QHNpZml2ZS5jb20KQ2M6IHZpbmNlbnQuY2hlbkBzaWZpdmUuY29t
CkNjOiB6b25nLmxpQHNpZml2ZS5jb20KQ2M6IGt2bUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGt2bS1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCkNjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1rc2VsZnRlc3RA
dmdlci5rZXJuZWwub3JnCgotLS0KWW9uZy1YdWFuIFdhbmcgKDUpOgogICAgICBLVk06IFJJU0Mt
VjogU0JJIEZXRlQ6IE1hcmsgdkNQVSBDU1JzIGRpcnR5IGFmdGVyIHNldHRpbmcgZmVhdHVyZSB2
YWx1ZQogICAgICBLVk06IFJJU0MtVjogU0JJIEZXRlQ6IEFkZCBvcHRpb25hbCBpbml0KCkgY2Fs
bGJhY2sgZm9yIGhhcmR3YXJlIHByb2JpbmcKICAgICAgS1ZNOiBSSVNDLVY6IFNCSSBGV0ZUOiBG
aXggc3RhbGUgZmVhdHVyZSBleHBvc3VyZSBhZnRlciBydW50aW1lIGV4dGVuc2lvbiBjaGFuZ2Vz
CiAgICAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogUmVmYWN0b3IgSVNBIGFuZCBTQkkgZXh0ZW5z
aW9uIHN1Ymxpc3QgbWFjcm9zCiAgICAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogU3BsaXQgU0JJ
IEZXRlQgaW50byBzZXBhcmF0ZSBmZWF0dXJlLXNwZWNpZmljIHN1Ymxpc3RzCgogYXJjaC9yaXNj
di9rdm0vdmNwdV9zYmlfZndmdC5jICAgICAgICAgICAgICAgICAgIHwgIDQ0ICsrKysrKystCiB0
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMgfCAxMzggKysr
KysrKysrKysrKystLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTI1IGluc2VydGlvbnMoKyks
IDU3IGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21taXQ6IGM3ODMyNTM0YTgxNjAyNzZjY2NiOWE4
Y2M4Y2FmYjU2MTRjNTc5ZDAKY2hhbmdlLWlkOiAyMDI2MDUyNi1rdm0tZ2V0X3JlZ19saXN0LXYy
LWY5ZjM2OTYxYWM2YwoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8va3ZtLXJpc2N2Cg==
