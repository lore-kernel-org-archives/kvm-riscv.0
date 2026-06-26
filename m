Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE010CDE012
	for <kvm-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 09:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WmChXFKp45VPp1xrgvHG+elJWhcpjvsluNT8xh+2O2A=; b=IBpdtTt+mt0Cx2
	C2gocIti4h2prLQztyaAVvd4apHt2r6ZZ9tqOjfgzSJDbN6IHLFeeK5oIH//2YglGOsLEQ0MedHub
	bSfObyQOVpyQHrmHgs47lAD0gKrLw3zjZpT9eMpn/LqDoFM8Gvj8grWqOk+nOk0daHwPcFiT32sbh
	BktgVvyQIeustgsS/OAVf5hjVH4m202S50csiGI27V4TS/2ed5agdfYUhoFVYtcR4HBm2PSjVhorq
	nrsdg641sTKhvanv5Z+P6vNU3i28mtbM1ofv0WzqSJq8pDYzxh6X89Fimne0YN7QjRmMCAsrN1G3X
	x2mIJ4vcz3Q8U9NL5dxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd31A-0000000B000-2DfQ;
	Fri, 26 Jun 2026 09:38:36 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd317-0000000AzxJ-0OIR
	for kvm-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 09:38:35 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-13981833e13so994748c88.1
        for <kvm-riscv@lists.infradead.org>; Fri, 26 Jun 2026 02:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782466712; x=1783071512; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ahOJU+va+iCo+TUhPo2SRXKP7ACC+q8Ka0Qw1HybGLs=;
        b=DPP0hTM5IwjHYliDqgIWRQgYNxwq3EoVtdDg3fUXFkeftdFncjUdJTyyF6uR8ZBTrO
         7j7gu8SwB7BRjSWykJMlJLwVYTnO4iMdoeDOsiV11o0SLCwe96UI0hD2bHtwjsHd7FW5
         nICpzxk5P0eEG41Vus7YCuDh5ZYTGs1xyuh9aLzYXfy0NjFlrpLiRkwOJvsZ5hKLRg3z
         gwMtYnOBGset2kppr8zZWKaw0H2CDfv13DFaoDKU/ucq/X7AL5UmD47eCu5h33hOltc8
         KDZeuVm4Xgg0v4kmNtLRU0IgzcCfO7l0iWNAt4uyQg2YJCMlc7wJKki1Wu2vDtXd5IFe
         V86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782466712; x=1783071512;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahOJU+va+iCo+TUhPo2SRXKP7ACC+q8Ka0Qw1HybGLs=;
        b=JYL86eaYow/TNNbiEzK3mKtC/Al+PTMottkepP43NUfL+6owKkHUCkkNATCmedAxV7
         9RxblUNVkE6mrZJzer/g5FMyZY6XQj/wNsfUmdCcjTYsLxmAvQuCC7gNtvpY/lqu4fZF
         4MjJhWNCnIX5P4rm2ovJvGiJJGLFDVS67YlOmCV8XA4n3hNQy7x6IM7VmxRk4x/6k73d
         IIuv37R2RNH03WMUPJDBBRnkkeg133vGzcIZwQp9L6UZ+X8wwVHEt8YuVdBKgxtjHxVN
         WDwa6uWymWuItUA8AMnmlbTDfH4jnKa1fX02s/f44nmP+8c1TiPOH+docwcerj/Hv2Db
         AHkw==
X-Forwarded-Encrypted: i=1; AFNElJ/Bdpbiw2F59RkICYYBKFUAXo9qRxXF4svouytL66AS0FI2vMBTPyPOBeCSRlqFiOdsy7qYyKXqLAk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyylz+A20en7VhgVGOEr3BCVQ/wNK+WMTKQC3ahpZ8DZLXcMa/i
	2wtUw5R4TgBESg98byivdPt37uhjs/Bo8CnD6hkLXrYvlLwsJWYPjUnYejdtDDZuJwY=
X-Gm-Gg: AfdE7cn9XMOHYdacXchKral2cTNv6ZCzh5NDC9R+k1ZAwReq3JDw9YfKXjSDhuLqSQL
	aeFHd4kVnTsOFbBWHKFKiaVRZqRJYNk9pqd9ZQKPd6enpMpBwFiQr+Rl6E37Ac08V6X0ZMAcRgx
	tOoJsMZAJtpwjfOue3o6uBwDaC6gdE9skOM2XvWV4vn0NkOx03PBXBfWCjPcx5EhIzH6X4V7hL6
	DI3prTqnZM8GpeJ+RlNTM4h4Nqk8uJPPjGawUjr3gR0s2fJfAMEs+cpnBDuU8zgd/Q+I83OkBoB
	ZWXsX2VJpcj/xVway/klo2m/92KejDvKwpGHvEXM6ChVafb3eDkEqyO1cPfvwCNZccb0SiomdBn
	47zsRUWOqUABvpMhiHRWC2C22F1+UkRbnKU/sBxeqhGGw4aVuZuBZ5+LzRN9/kt+bzJtm4rCrlv
	ACdb9WgRjPQxbwqUo1135HzLYEyZ85vDqj
X-Received: by 2002:a05:7023:b0b:b0:138:4e43:6399 with SMTP id a92af1059eb24-139dba390d3mr5179145c88.11.1782466712224;
        Fri, 26 Jun 2026 02:38:32 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d90e95c6sm24350302c88.11.2026.06.26.02.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 02:38:31 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v3 0/2] KVM: RISC-V: Add CPU PM notifier for non-retention
 idle states
Date: Fri, 26 Jun 2026 02:38:28 -0700
Message-Id: <20260626-kvm-cpu-pm-v3-0-be051aafe9ba@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJRIPmoC/22Nyw6CMBQFf4V07TVtbaG48j+Mi1JupRoeaaHRE
 P5dihtJXE5yZs5MAnqHgZyzmXiMLri+W+F0yIhpdHdHcPXKhFOe05wLeMYWzDDB0EIpmGAaTS2
 tJqsweLTutcWuty+HqXqgGVMhLRoXxt6/t7fI0u5vODJgIDlVChkvtJSX4KyLeDR9S1I58l833
 7kcKIhCoUSralNWO3dZlg844nt+8wAAAA==
X-Change-ID: 20260624-kvm-cpu-pm-94141aecd5fa
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Nutty Liu <nutty.liu@hotmail.com>, Jinyu Tang <tjytimi@163.com>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782466711; l=2360;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=qQcMxL59ny4eUfn3dsIk5ayHiwXmBIItrmm62vfeWXk=;
 b=H6mYJjzESG/VwDOEeC0xPHpknfIIgWTeSFPTCc1Gi3fXeoF8Wrsnb3Nn4WeRLb/Bx/h/OtRr5
 StJvFjBso9LBOaO9fENW9QWzk2esy0s1GJu+pf/V/7sp5bmpSGDIjrt
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_023833_144619_40BB3F74 
X-CRM114-Status: UNSURE (   8.49  )
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

VGhpcyBzZXJpZXMgYWRkcyBDUFVfUE0gbm90aWZpZXIgc3VwcG9ydCB0byBzYXZlIGFuZCByZXN0
b3JlIGh5cGVydmlzb3IKQ1NSIHN0YXRlIHdoZW4gQ1BVcyBlbnRlciBub24tcmV0ZW50aW9uIGlk
bGUgc3RhdGVzIHdoZXJlIHRoZSBDUFUgZG9tYWluCmlzIHBvd2VyZWQgb2ZmLgpQYXRjaCAxIGZp
eGVzIGEgVkNQVSBjYWNoZSBpbnZhbGlkYXRpb24gYnVnIHRoYXQgY291bGQgY2F1c2UgaW5jb3Jy
ZWN0CkNTUiByZXN0b3JhdGlvbiBhZnRlciBwb3dlciBzdGF0ZSB0cmFuc2l0aW9ucy4KClBhdGNo
IDIgaW1wbGVtZW50cyB0aGUgQ1BVX1BNIG5vdGlmaWVyIHRvIGhhbmRsZSBDU1Igc2F2ZS9yZXN0
b3JlIGR1cmluZwpDUFUgaWRsZSwgY29tcGxldGluZyBLVk0ncyBwb3dlciBtYW5hZ2VtZW50IGNv
dmVyYWdlIGFsb25nc2lkZSBleGlzdGluZwpDUFUgaG90cGx1ZyBhbmQgc3lzdGVtIHN1c3BlbmQg
bWVjaGFuaXNtcy4KCi0tLQpDaGFuZ2VzIGluIHYzOgotIFJlbW92ZSB0aGUgZXJyb3Iga3ZtX3Jp
c2N2X25hY2xfZGlzYWJsZSgpIGNhbGwgaW4ga3ZtX3Jpc2N2X2Nzcl9kaXNhYmxlKCkKKHNhc2hp
a28pCi0gVW5yZWdpc3RlciBDUFUgUE0gbm90aWZpZXIgZmlyc3QgaW4gcmlzY3Zfa3ZtX2V4aXQo
KSAoc2FzaGlrbykKLSBMaW5rIHRvIHYyOiBodHRwczovL3BhdGNoLm1zZ2lkLmxpbmsvMjAyNjA2
MjYta3ZtLWNwdS1wbS12Mi0wLTQ3OGU1ZWY4ZGM5YkBzaWZpdmUuY29tCgpDaGFuZ2VzIGluIHYy
OgotIEFkZCBwYXRjaCAxIGZvcmNlIHJlc3RvcmUgVkNQVSBhZnRlciBwb3dlciBzdGF0ZSB0cmFu
c2l0aW9ucyAoc2FzaGlrbykKLSBBZGRlZCBDUFVfUE1fRU5URVJfRkFJTEVEIGV2ZW50IGhhbmRs
aW5nIChzYXNoaWtvKQotIE9wdGltaXplZCBIR0VJRSBzYXZlL3Jlc3RvcmUgd2l0aCBzYXZlZF92
YWx1ZSBmaWVsZCAoc2FzaGlrbykKLSBGaXhlZCBISUUgQ1NSIHJlc3RvcmF0aW9uIGluIGxpZ2h0
d2VpZ2h0IGlkbGUgcmVzdW1lIHBhdGggKHNhc2hpa28pCi0gTGluayB0byB2MTogaHR0cHM6Ly9w
YXRjaC5tc2dpZC5saW5rLzIwMjYwNjI0LWt2bS1jcHUtcG0tdjEtMS01MjA4OGUxMjdhNTVAc2lm
aXZlLmNvbQoKLS0tCgpUbzogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KVG86IEF0
aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUBsaW51eC5kZXY+ClRvOiBQYXVsIFdhbG1zbGV5IDxwandA
a2VybmVsLm9yZz4KVG86IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+ClRvOiBB
bGJlcnQgT3UgPGFvdUBlZWNzLmJlcmtlbGV5LmVkdT4KVG86IEFsZXhhbmRyZSBHaGl0aSA8YWxl
eEBnaGl0aS5mcj4KVG86IFJhZGltIEtyxI1tw6HFmSA8cmFkaW0ua3JjbWFyQG9zcy5xdWFsY29t
bS5jb20+ClRvOiBBbmRyZXcgSm9uZXMgPGFuZHJldy5qb25lc0Bvc3MucXVhbGNvbW0uY29tPgpU
bzogTnV0dHkgTGl1IDxudXR0eS5saXVAaG90bWFpbC5jb20+ClRvOiBKaW55dSBUYW5nIDx0anl0
aW1pQDE2My5jb20+CkNjOiBncmVlbnRpbWUuaHVAc2lmaXZlLmNvbQpDYzogdmluY2VudC5jaGVu
QHNpZml2ZS5jb20KQ2M6IHpvbmcubGlAc2lmaXZlLmNvbQpDYzoga3ZtQHZnZXIua2VybmVsLm9y
ZwpDYzoga3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKCi0tLQpZb25n
LVh1YW4gV2FuZyAoMik6CiAgICAgIEtWTTogUklTQy1WOiBDbGVhciBmb3JtZXIgVkNQVSBjYWNo
ZSBvbiB2aXJ0dWFsaXphdGlvbiBkaXNhYmxlCiAgICAgIEtWTTogUklTQy1WOiBBZGQgQ1BVIFBN
IG5vdGlmaWVyIGZvciBub24tcmV0ZW50aW9uIGlkbGUgc3RhdGVzCgogYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9rdm1fYWlhLmggIHwgIDE1ICsrKy0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3Zt
X2hvc3QuaCB8ICAgMiArCiBhcmNoL3Jpc2N2L2t2bS9haWEuYyAgICAgICAgICAgICAgfCAxNDQg
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0KIGFyY2gvcmlzY3Yva3ZtL21h
aW4uYyAgICAgICAgICAgICB8ICA5OCArKysrKysrKysrKysrKysrKysrKystLS0tLQogYXJjaC9y
aXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAgIHwgIDExICsrKwogNSBmaWxlcyBjaGFuZ2VkLCAx
ODcgaW5zZXJ0aW9ucygrKSwgODMgZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNvbW1pdDogNTI3Mzgz
NTJhNmYyOTI3OWUxNTI4NWZjYjdiNTAyNDFlZjg2N2UyNwpjaGFuZ2UtaWQ6IDIwMjYwNjI0LWt2
bS1jcHUtcG0tOTQxNDFhZWNkNWZhCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9rdm0tcmlzY3YK
