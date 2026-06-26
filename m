Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BADCD4F26
	for <kvm-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QwaPGVe6KEDeQvXcTZKOzU/L/xtvPIVjkLcSBvp2+lQ=; b=pKbob5IFWOWisq
	GdFoJGXdVd3KFAvN7xW1W4iBI47NgDKQqlgnwrkwKf4ZkR/WX4Ly0SbD+37TlNUAl6NkjHGrgSADT
	X3mFfIyvGEdlhSTKY/ChsqoAs3OPq7Dzc5H1SCqRs0SRoykLiZWmru3QfqSkg0sqm3HzUEDYc4iPK
	6S4Q5EVpVQYZ+8y7Ln1nhDguAqQ5hiSkskzHgn8FQ2vOc/tgacukTiZzYv+kYRHxX7OFhkzaMhsIg
	mazXzIM5vvObJ62FEGh/FcULcH63hv8W+/PZPqDtI+TKbisW7OhjrEf00goojc1XUpWRKWLgXYq/M
	TFOMd1XnfviysJmNE62Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1r0-0000000Aqi2-1IzI;
	Fri, 26 Jun 2026 08:24:02 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1qy-0000000Aqfz-03p5
	for kvm-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 08:24:01 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-13810b63a1aso1898205c88.1
        for <kvm-riscv@lists.infradead.org>; Fri, 26 Jun 2026 01:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782462239; x=1783067039; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4ccpgKTbVU35FcpL6ebiWIfE77fSWC1R9tsT9g07kXw=;
        b=Q0n+AdxG1YHyZx3kCjZUAY4OAcDgakAAvcPWgkMWqK5cM6ql77cGVwoP3GtJ8bI3DO
         NAj+QYadzM41vw/0NWZeCw4/TX47dZqJDVOP9NEP9eRXgEa40tjSQIpg/idAmXDgKXqY
         rareX2TOiXmIk0F68K602YzZV1VLcHVQyIhdQAZf0wdSkwBeHZNPedB0Cs1SkhxQVdZv
         xVpoSyQcNmMGvesMfXWYdQ+H58uzAg/Alld91Dt2KqhYKhLAgGeDvCKMMG/UEYlw3HH9
         WdmLcrlZEl3IeiLY6jqnJAAPQCKbdF53ONU0wyOQnhtY8vKDVdeQLxKCDeAYfohzMgjS
         jrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782462239; x=1783067039;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ccpgKTbVU35FcpL6ebiWIfE77fSWC1R9tsT9g07kXw=;
        b=SCZcdYiMTvaM6+2aCbjlIl15kOqqKEzOl4Zv9WXiSpgkbm1bSpdi1NptanL63BnMKz
         6DHz1GW9z7MvgfTupVlQ4bXZnnasKgNdThjByWfMiB2xDaY43hEZ8KpOZVP+/ONkBDRA
         HWkEB1RiDAJmjxUwH+JK4Xkli9u7nFwjkjOzel/qrnAPl2ZBcZunkm0PN936h/s9FYlZ
         lTR0e6oAFVKOsvIfmfjIxk48GElpRMt46+4oOUuND2EDw7feXolMOqnTlSC4hIhnhxEX
         YT2gDvRrHbGztArjwJyEu+Z5jc8Iy5UN01zXklgAk3rYftzAO727iQqFGX9JyqIy5FSf
         TneQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xcX/GWET5f5Aj4cUNqT8xTxlz0nFjQZOR1e0V05rndU6IoCsPqlnYYIAZ4YrLhHTVHA0gc4+mLuU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyN8t2nqaV5PN/OWNmUTrvKZ4h6Fh9ninZy0EvSrSbWpetnVH10
	Kb4CbGaWEYg/3s/SHRRID4UenpS2nGy5SZO7LIPLWoS1Br5BT/a6PwWpayzd3pzwnMo=
X-Gm-Gg: AfdE7cmRn6uQCsJob6DSVa0TK2T1G7fII4ruyfr2iQwsivHMXy/miOvMleppRyVL4ct
	BlgzV6wMq+UQGYe6wv2pSXLLquPOCKf9Pxcch0exdnLQpPx35K14SrmDFNo+TJuifTeiCJG2dVi
	solKAnRiTHWWW8nUJJSNccORqkvj1gkx5JF82FcCEZN8wxrxL7YzrQTdAbz50l6H6okoKZuv4Dy
	HdVf6RDj2zTdOS5eSdpnJW31seuwReG54uapdjpbYIHVw6K+Ci6lJUhpd/+Ehc6StLMmloMaRnb
	1MqS8qoQ7jSW3EipN0/TOPYob20NLH1e/EAcYgRrAa26yZetadPaVZKyyZQjimlhIKVBzEwrbB/
	69YjHV8DM4Xdi7rR+CBOuHYCsokTPoZxZ1tVGoAX9uvKzFNvhO/1GlDjgS0Iqw2JpEWySRyICLU
	VcaQYbyz0INVbWcaLoCAtnKQQXK65LxXkJrQaTuIK5YDI=
X-Received: by 2002:a05:7022:4597:b0:136:c565:e862 with SMTP id a92af1059eb24-139dbb529f0mr4508204c88.26.1782462238802;
        Fri, 26 Jun 2026 01:23:58 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f318e7sm15557199c88.3.2026.06.26.01.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 01:23:58 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v2 0/2] KVM: RISC-V: Add CPU PM notifier for non-retention
 idle states
Date: Fri, 26 Jun 2026 01:23:20 -0700
Message-Id: <20260626-kvm-cpu-pm-v2-0-478e5ef8dc9b@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPg2PmoC/22Nyw6CMBBFf4XM2jFtQxFd+R+GRS1TGQ2PtNBoC
 P9ui1uXJzn33BUCeaYAl2IFT5EDj0MCdSjAdmZ4EHKbGJRQlahUia/Yo50WnHo8l7KUhmyrnYE
 0mDw5fu+xW/PjsNyfZOdcyEbHYR79Z3+LMnt/w1GiRK1EXZNUJ6P1NbDjSEc79tBs2/YFdeOEK
 bcAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782462237; l=2099;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=aOcN8mnYJvpUbDHzKnJv3eWv6lFjVcVGulc7fYXjqSU=;
 b=giWvwAPg7EAWMUg2prEKaAltGBPuyswuvK1/Q0rWzme2xOkcN1QD/CpdhHYbwsyAYOxyuNWiG
 DcsF+dE2RumAj+v9AFM++BmT1nwPZnp8MWfxtu77AhMM5SrE3OOXSOs
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_012400_069822_551CBE0A 
X-CRM114-Status: UNSURE (   8.20  )
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
bWVjaGFuaXNtcy4KCi0tLQpDaGFuZ2VzIGluIHYyOgotIEFkZCBwYXRjaCAxIGZvcmNlIHJlc3Rv
cmUgVkNQVSBhZnRlciBwb3dlciBzdGF0ZSB0cmFuc2l0aW9ucyAoc2FzaGlrbykKLSBBZGRlZCBD
UFVfUE1fRU5URVJfRkFJTEVEIGV2ZW50IGhhbmRsaW5nIChzYXNoaWtvKQotIE9wdGltaXplZCBI
R0VJRSBzYXZlL3Jlc3RvcmUgd2l0aCBzYXZlZF92YWx1ZSBmaWVsZCAoc2FzaGlrbykKLSBGaXhl
ZCBISUUgQ1NSIHJlc3RvcmF0aW9uIGluIGxpZ2h0d2VpZ2h0IGlkbGUgcmVzdW1lIHBhdGggKHNh
c2hpa28pCi0gTGluayB0byB2MTogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYwNjI0LWt2
bS1jcHUtcG0tdjEtMS01MjA4OGUxMjdhNTVAc2lmaXZlLmNvbQoKLS0tCgpUbzogQW51cCBQYXRl
bCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KVG86IEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUBsaW51
eC5kZXY+ClRvOiBQYXVsIFdhbG1zbGV5IDxwandAa2VybmVsLm9yZz4KVG86IFBhbG1lciBEYWJi
ZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+ClRvOiBBbGJlcnQgT3UgPGFvdUBlZWNzLmJlcmtlbGV5
LmVkdT4KVG86IEFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0aS5mcj4KVG86IFJhZGltIEtyxI1t
w6HFmSA8cmFkaW0ua3JjbWFyQG9zcy5xdWFsY29tbS5jb20+ClRvOiBBbmRyZXcgSm9uZXMgPGFu
ZHJldy5qb25lc0Bvc3MucXVhbGNvbW0uY29tPgpUbzogTnV0dHkgTGl1IDxudXR0eS5saXVAaG90
bWFpbC5jb20+ClRvOiBKaW55dSBUYW5nIDx0anl0aW1pQDE2My5jb20+CkNjOiBncmVlbnRpbWUu
aHVAc2lmaXZlLmNvbQpDYzogdmluY2VudC5jaGVuQHNpZml2ZS5jb20KQ2M6IHpvbmcubGlAc2lm
aXZlLmNvbQpDYzoga3ZtQHZnZXIua2VybmVsLm9yZwpDYzoga3ZtLXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKQ2M6IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmcKCi0tLQpZb25nLVh1YW4gV2FuZyAoMik6CiAgICAgIEtWTTog
UklTQy1WOiBDbGVhciBmb3JtZXIgVkNQVSBjYWNoZSBvbiB2aXJ0dWFsaXphdGlvbiBkaXNhYmxl
CiAgICAgIEtWTTogUklTQy1WOiBBZGQgQ1BVIFBNIG5vdGlmaWVyIGZvciBub24tcmV0ZW50aW9u
IGlkbGUgc3RhdGVzCgogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fYWlhLmggIHwgIDE1ICsr
Ky0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCB8ICAgMiArCiBhcmNoL3Jpc2N2
L2t2bS9haWEuYyAgICAgICAgICAgICAgfCAxNDQgKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0KIGFyY2gvcmlzY3Yva3ZtL21haW4uYyAgICAgICAgICAgICB8IDEwMCArKysr
KysrKysrKysrKysrKysrKystLS0tLQogYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAg
IHwgIDExICsrKwogNSBmaWxlcyBjaGFuZ2VkLCAxODkgaW5zZXJ0aW9ucygrKSwgODMgZGVsZXRp
b25zKC0pCi0tLQpiYXNlLWNvbW1pdDogNTI3MzgzNTJhNmYyOTI3OWUxNTI4NWZjYjdiNTAyNDFl
Zjg2N2UyNwpjaGFuZ2UtaWQ6IDIwMjYwNjI0LWt2bS1jcHUtcG0tOTQxNDFhZWNkNWZhCgoKLS0g
Cmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
