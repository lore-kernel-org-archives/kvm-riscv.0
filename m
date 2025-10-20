Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B60CCD193
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 13:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9hOckaPm7mxnMMX7azXajlr1seFyPdDkr+wNvZ6o5G0=; b=GDY6Xy7OVDnafJ
	5peGAUIGR/a+Dw+SxcDUaOQQkCePZm/vXp9chzU9MaCenXEYnCl+SDhXMueWOTN+sp7sGCl8jlLt6
	sxb6cBaedmAkPq5PwLTPdQd9pAMwk86xoQqns0jHjMPwJQ1cOb9FtTATd89junPSoD1OmmsmMHpW+
	p55PG3K8P3ui63g9ArZgAXqJ7UHlvRuOxs8PV1jWPGxrjIohlfOUr+EtqS+7cOECBojqSkwO7iGSE
	W6yAGrpc8KRVneFn1jIZA9lHS/euJwkrgWH6+YkaszUUmBWVXuYHM+r1wiVi07besZ7M6z9uiKdob
	Lnejj6EcKy2e6w0Fa9Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAq2O-0000000Do0H-00LM;
	Mon, 20 Oct 2025 13:35:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAq2M-0000000DnyU-19AL
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 13:34:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 62EB748AD8
	for <kvm-riscv@lists.infradead.org>; Mon, 20 Oct 2025 13:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4867DC19423
	for <kvm-riscv@lists.infradead.org>; Mon, 20 Oct 2025 13:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760967285;
	bh=qaL9YbmZJTW/ixYO94qG+wib+260CKv9uoYvrwMFIF8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LLbFebj0QTtB6YA74PS9tZdmJXL4RcwkLs2Dje0VXKlCPsBntF9N4S5BhECVaKh8m
	 T0J3oqUTtaQAMyJ/F2CXEQFDJZC6j1Miqb90fy8elhcxnKksssCim0Qx6cM4x5wnIX
	 f1GtlWBkwBv/GDq74+7rbV93xpPZZTo0UndgA/KA4xkHLVvBFK97ISffCpWWv6+tz/
	 /0N7AnyJZSY7oG2JIY8wdEd67OGnwo3JlbebG0p/mxRj8Dc5NOmGKf4ZqnekmpTjaJ
	 8RQmuvjv0Ot0TPGwwngkdYuh3UYIuhKGRruWaVQ84Aru0/71Ns+75YrwLV9iWjqo9v
	 louuYmT31YEzA==
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-427015003eeso3204355f8f.0
        for <kvm-riscv@lists.infradead.org>; Mon, 20 Oct 2025 06:34:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVzgGBIiApams/+zucNVkxaz6pk9etcPorS9eLv5pY1CBm4rRmZNtARr/9naDbd71KE4S0IFb72QKs=@lists.infradead.org
X-Gm-Message-State: AOJu0YyFqsKHrYvZFN/wdu3JsZVjgZM3VPBjQ/d3dghxJ/SLGYKwo7gH
	K/0Kuvkdkschr6OGFffIpzV6QIRCsKSH6qQ3B2Cj/K9u0xrygqWMimeVvn+GGFsjTtgdheEXDmY
	CcITdY34VeH5wtrXfa51YW5MoUZkAV04=
X-Google-Smtp-Source: AGHT+IFQwlCf7FjnCPutO24ZzoIvXCKxA8V6xzsVKhuniPH312m1I40LeS2q7hRVe9Mx5ZgcbJzBUyetjP4FtY8fo7s=
X-Received: by 2002:a05:6000:2c0c:b0:427:928:78a0 with SMTP id
 ffacd0b85a97d-42709287a50mr7648478f8f.63.1760967283331; Mon, 20 Oct 2025
 06:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <20251020042056.30283-1-luxu.kernel@bytedance.com> <20251020042056.30283-5-luxu.kernel@bytedance.com>
In-Reply-To: <20251020042056.30283-5-luxu.kernel@bytedance.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 20 Oct 2025 21:34:27 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRyXPxtw1mvMEAt2NLMUecu++DyN8n+HxmcpbPPF_KB3Q@mail.gmail.com>
X-Gm-Features: AS18NWDpy2g1Qp1BbuHJudf6VVHWVv_M97q7whwhpvd314t5p96b7PWN5zNzj08
Message-ID: <CAJF2gTRyXPxtw1mvMEAt2NLMUecu++DyN8n+HxmcpbPPF_KB3Q@mail.gmail.com>
Subject: Re: [PATCH v4 04/10] riscv: Introduce Zalasr instructions
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, will@kernel.org, peterz@infradead.org, 
	boqun.feng@gmail.com, mark.rutland@arm.com, anup@brainfault.org, 
	atish.patra@linux.dev, pbonzini@redhat.com, shuah@kernel.org, 
	parri.andrea@gmail.com, ajones@ventanamicro.com, brs@rivosinc.com, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	apw@canonical.com, joe@perches.com, lukas.bulwahn@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_063458_358536_4154FAFA 
X-CRM114-Status: GOOD (  11.47  )
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

T24gTW9uLCBPY3QgMjAsIDIwMjUgYXQgMTI6MjHigK9QTSBYdSBMdSA8bHV4dS5rZXJuZWxAYnl0
ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiBJbnRyb2R1Y2UgbHtifGh8d3xkfS57YXF8YXFybH0gYW5k
IHN7YnxofHd8ZH0ue3JsfGFxcmx9IGluc3RydWN0aW9uCj4gZW5jb2RpbmdzLgo+Cj4gU2lnbmVk
LW9mZi1ieTogWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20+Cj4gLS0tCj4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vaW5zbi1kZWYuaCB8IDc5ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDc5IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2luc24tZGVmLmggYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2luc24tZGVmLmgKPiBpbmRleCBkNWFkYmFlYzFkMDEwLi4zZmVjN2U2NmNlNTBmIDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi1kZWYuaAo+ICsrKyBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi1kZWYuaAo+IEBAIC0xNzksNiArMTc5LDcgQEAKPiAg
I2RlZmluZSBSVl9fX1JTMSh2KSAgICAgICAgICAgIF9fUlZfUkVHKHYpCj4gICNkZWZpbmUgUlZf
X19SUzIodikgICAgICAgICAgICBfX1JWX1JFRyh2KQo+Cj4gKyNkZWZpbmUgUlZfT1BDT0RFX0FN
TyAgICAgICAgICBSVl9PUENPREUoNDcpCj4gICNkZWZpbmUgUlZfT1BDT0RFX01JU0NfTUVNICAg
ICBSVl9PUENPREUoMTUpCj4gICNkZWZpbmUgUlZfT1BDT0RFX09QX0lNTSAgICAgICBSVl9PUENP
REUoMTkpCj4gICNkZWZpbmUgUlZfT1BDT0RFX1NZU1RFTSAgICAgICBSVl9PUENPREUoMTE1KQo+
IEBAIC0yMDgsNiArMjA5LDg0IEBACj4gICAgICAgICBfX0FTTV9TVFIoLmVycm9yICJobHYuZCBy
ZXF1aXJlcyA2NC1iaXQgc3VwcG9ydCIpCj4gICNlbmRpZgo+Cj4gKyNkZWZpbmUgTEJfQVEoZGVz
dCwgYWRkcikgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAg
IElOU05fUihPUENPREVfQU1PLCBGVU5DMygwKSwgRlVOQzcoMjYpLCAgICAgICAgICAgICAgICAg
XAo+ICsgICAgICAgICAgICAgIFJEKGRlc3QpLCBSUzEoYWRkciksIF9fUlMyKDApKQo+ICsKPiAr
I2RlZmluZSBMQl9BUVJMKGRlc3QsIGFkZHIpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAo+ICsgICAgICAgSU5TTl9SKE9QQ09ERV9BTU8sIEZVTkMzKDApLCBGVU5DNygyNyks
ICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgUkQoZGVzdCksIFJTMShhZGRyKSwg
X19SUzIoMCkpCj4gKwo+ICsjZGVmaW5lIExIX0FRKGRlc3QsIGFkZHIpICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICBJTlNOX1IoT1BDT0RFX0FNTywgRlVO
QzMoMSksIEZVTkM3KDI2KSwgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICBSRChk
ZXN0KSwgUlMxKGFkZHIpLCBfX1JTMigwKSkKPiArCj4gKyNkZWZpbmUgTEhfQVFSTChkZXN0LCBh
ZGRyKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgIElOU05f
UihPUENPREVfQU1PLCBGVU5DMygxKSwgRlVOQzcoMjcpLCAgICAgICAgICAgICAgICAgXAo+ICsg
ICAgICAgICAgICAgIFJEKGRlc3QpLCBSUzEoYWRkciksIF9fUlMyKDApKQo+ICsKPiArI2RlZmlu
ZSBMV19BUShkZXN0LCBhZGRyKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAo+ICsgICAgICAgSU5TTl9SKE9QQ09ERV9BTU8sIEZVTkMzKDIpLCBGVU5DNygyNiksICAgICAg
ICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgUkQoZGVzdCksIFJTMShhZGRyKSwgX19SUzIo
MCkpCj4gKwo+ICsjZGVmaW5lIExXX0FRUkwoZGVzdCwgYWRkcikgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICBJTlNOX1IoT1BDT0RFX0FNTywgRlVOQzMoMiks
IEZVTkM3KDI3KSwgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICBSRChkZXN0KSwg
UlMxKGFkZHIpLCBfX1JTMigwKSkKPiArCj4gKyNkZWZpbmUgU0JfUkwoc3JjLCBhZGRyKSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgIElOU05fUihPUENP
REVfQU1PLCBGVU5DMygwKSwgRlVOQzcoMjkpLCAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAg
ICAgICAgIF9fUkQoMCksIFJTMShhZGRyKSwgUlMyKHNyYykpCj4gKwo+ICsjZGVmaW5lIFNCX0FR
Ukwoc3JjLCBhZGRyKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAg
ICAgICBJTlNOX1IoT1BDT0RFX0FNTywgRlVOQzMoMCksIEZVTkM3KDMxKSwgICAgICAgICAgICAg
ICAgIFwKPiArICAgICAgICAgICAgICBfX1JEKDApLCBSUzEoYWRkciksIFJTMihzcmMpKQo+ICsK
PiArI2RlZmluZSBTSF9STChzcmMsIGFkZHIpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXAo+ICsgICAgICAgSU5TTl9SKE9QQ09ERV9BTU8sIEZVTkMzKDEpLCBGVU5DNygy
OSksICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgX19SRCgwKSwgUlMxKGFkZHIp
LCBSUzIoc3JjKSkKPiArCj4gKyNkZWZpbmUgU0hfQVFSTChzcmMsIGFkZHIpICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgIElOU05fUihPUENPREVfQU1PLCBG
VU5DMygxKSwgRlVOQzcoMzEpLCAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgIF9f
UkQoMCksIFJTMShhZGRyKSwgUlMyKHNyYykpCj4gKwo+ICsjZGVmaW5lIFNXX1JMKHNyYywgYWRk
cikgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICBJTlNO
X1IoT1BDT0RFX0FNTywgRlVOQzMoMiksIEZVTkM3KDI5KSwgICAgICAgICAgICAgICAgIFwKPiAr
ICAgICAgICAgICAgICBfX1JEKDApLCBSUzEoYWRkciksIFJTMihzcmMpKQo+ICsKPiArI2RlZmlu
ZSBTV19BUVJMKHNyYywgYWRkcikgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAo+ICsgICAgICAgSU5TTl9SKE9QQ09ERV9BTU8sIEZVTkMzKDIpLCBGVU5DNygzMSksICAgICAg
ICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgX19SRCgwKSwgUlMxKGFkZHIpLCBSUzIoc3Jj
KSkKPiArCj4gKyNpZmRlZiBDT05GSUdfNjRCSVQKPiArI2RlZmluZSBMRF9BUShkZXN0LCBhZGRy
KSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgSU5TTl9S
KE9QQ09ERV9BTU8sIEZVTkMzKDMpLCBGVU5DNygyNiksICAgICAgICAgICAgICAgICBcCj4gKyAg
ICAgICAgICAgICAgUkQoZGVzdCksIFJTMShhZGRyKSwgX19SUzIoMCkpCj4gKwo+ICsjZGVmaW5l
IExEX0FRUkwoZGVzdCwgYWRkcikgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gKyAgICAgICBJTlNOX1IoT1BDT0RFX0FNTywgRlVOQzMoMyksIEZVTkM3KDI3KSwgICAgICAg
ICAgICAgICAgIFwKPiArICAgICAgICAgICAgICBSRChkZXN0KSwgUlMxKGFkZHIpLCBfX1JTMigw
KSkKPiArCj4gKyNkZWZpbmUgU0RfUkwoc3JjLCBhZGRyKSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiArICAgICAgIElOU05fUihPUENPREVfQU1PLCBGVU5DMygzKSwg
RlVOQzcoMjkpLCAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgIF9fUkQoMCksIFJT
MShhZGRyKSwgUlMyKHNyYykpCj4gKwo+ICsjZGVmaW5lIFNEX0FRUkwoc3JjLCBhZGRyKSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICBJTlNOX1IoT1BDT0RF
X0FNTywgRlVOQzMoMyksIEZVTkM3KDMxKSwgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICAg
ICAgICBfX1JEKDApLCBSUzEoYWRkciksIFJTMihzcmMpKQo+ICsjZWxzZQo+ICsjZGVmaW5lIExE
X0FRKGRlc3QsIGFkZHIpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4g
KyAgICAgICBfX0FTTV9TVFIoLmVycm9yICJsZC5hcSByZXF1aXJlcyA2NC1iaXQgc3VwcG9ydCIp
Cj4gKwo+ICsjZGVmaW5lIExEX0FRUkwoZGVzdCwgYWRkcikgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCj4gKyAgICAgICBfX0FTTV9TVFIoLmVycm9yICJsZC5hcXJsIHJlcXVp
cmVzIDY0LWJpdCBzdXBwb3J0IikKPiArCj4gKyNkZWZpbmUgU0RfUkwoZGVzdCwgYWRkcikgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgIF9fQVNNX1NUUigu
ZXJyb3IgInNkLnJsIHJlcXVpcmVzIDY0LWJpdCBzdXBwb3J0IikKPiArCj4gKyNkZWZpbmUgU0Rf
QVFSTChkZXN0LCBhZGRyKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAr
ICAgICAgIF9fQVNNX1NUUiguZXJyb3IgInNkLmFxcmwgcmVxdWlyZXMgNjQtYml0IHN1cHBvcnQi
KQo+ICsjZW5kaWYKPiArCj4gICNkZWZpbmUgU0lOVkFMX1ZNQSh2YWRkciwgYXNpZCkgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgSU5TTl9SKE9QQ09E
RV9TWVNURU0sIEZVTkMzKDApLCBGVU5DNygxMSksICAgICAgICAgICAgICBcCj4gICAgICAgICAg
ICAgICAgX19SRCgwKSwgUlMxKHZhZGRyKSwgUlMyKGFzaWQpKQo+IC0tCj4gMi4yMC4xCj4KSSBk
aWRuJ3QgZmluZCBwcm9ibGVtLgoKUmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwu
b3JnPgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxp
c3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
