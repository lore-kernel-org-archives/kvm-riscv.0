Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C675C77B7F
	for <kvm-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 09:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Bv+1p8GgihVEFmqyzMF3wCfvmyVFOHiogOCRsbdPQI=; b=YPP/hbmoVO34/E
	6eoI1+yShOmcm3Z/W5LVfY+TYf/r7I9ZeT6l3D+gxU0ipMU2EmkJpFI3/dBMg+6S54zb7TGRVGz5n
	VZehd7irPMFntyA7HKhuFwgrM3dy4MLkDvGBeeC1v/fG2xlYuLbdKyHazTFGQS2drnf4lIjW0iRRy
	p0l9cyLWzm1oPr0bmTKnJIgwOenIvlFXKw1fhy2pT9b0Gv3lneNmowWCoE9HhHfzPoZtVOYgGvLyl
	n+VPxpY9ReiiNniTA2a4kdvHfsqHUkGUegPSsuUOD4NIhiaHx87dCL9UD32f+VLilQa9WkADyXz1t
	QWrWvl+dK4v1UvrG2jQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdAJ-000000027CJ-2kOs;
	Mon, 23 Jun 2025 09:08:35 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcrH-000000023FR-35yR;
	Mon, 23 Jun 2025 08:48:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A60C943210;
	Mon, 23 Jun 2025 08:48:44 +0000 (UTC)
Message-ID: <1ebde39e-f5b4-4f8c-a0df-f53cce67f4ef@ghiti.fr>
Date: Mon, 23 Jun 2025 10:48:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] Move duplicated instructions macros into
 asm/insn.h
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Andrew Jones <ajones@ventanamicro.com>
References: <20250620-dev-alex-insn_duplicate_v5_manual-v5-0-d865dc9ad180@rivosinc.com>
 <c12729a1-5046-4821-b5fe-5fea72af76c8@rivosinc.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <c12729a1-5046-4821-b5fe-5fea72af76c8@rivosinc.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduieehjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepudffueegvddtgeeluefhueetteeugeeffeekhfehffdvudfhgedvheduudekffegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpihhnfhhrrgguvggrugdrohhrghenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmedvieeijeemvgejvgdtmeehudeltdemfhgvtdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmedvieeijeemvgejvgdtmeehudeltdemfhgvtdehpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmedvieeijeemvgejvgdtmeehudeltdemfhgvtdehngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedufedprhgtphhtthhopegtlhgvghgvrhesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtoheprghlvgigghhhihhtihesrhhivhhoshhinhgtr
 dgtohhmpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegrnhhuphessghrrghinhhfrghulhhtrdhorhhgpdhrtghpthhtoheprghtihhshhdrphgrthhrrgeslhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_014855_903704_2D357C5B 
X-CRM114-Status: GOOD (  12.46  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDYvMjMvMjUgMTA6MDcsIENsw6ltZW50IEzDqWdlciB3cm90ZToKPgo+IE9uIDIwLzA2LzIw
MjUgMjI6MjEsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPj4gVGhlIGluc3RydWN0aW9ucyBwYXJz
aW5nIG1hY3JvcyB3ZXJlIGR1cGxpY2F0ZWQgYW5kIG9uZSBvZiB0aGVtIGhhZCBkaWZmZXJlbnQK
Pj4gaW1wbGVtZW50YXRpb25zLCB3aGljaCBpcyBlcnJvciBwcm9uZS4KPj4KPj4gU28gbGV0J3Mg
Y29uc29saWRhdGUgdGhvc2UgbWFjcm9zIGluIGFzbS9pbnNuLmguCj4+Cj4+IHYxOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI1MDQyMjA4MjU0NS40NTA0NTMtMS1hbGV4
Z2hpdGlAcml2b3NpbmMuY29tLwo+PiB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
cmlzY3YvMjAyNTA1MDgwODIyMTUuODg2NTgtMS1hbGV4Z2hpdGlAcml2b3NpbmMuY29tLwo+PiB2
MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNTA1MDgxMjUyMDIuMTA4
NjEzLTEtYWxleGdoaXRpQHJpdm9zaW5jLmNvbS8KPj4gdjQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LXJpc2N2LzIwMjUwNTE2MTQwODA1LjI4Mjc3MC0xLWFsZXhnaGl0aUByaXZvc2lu
Yy5jb20vCj4+Cj4+IENoYW5nZXMgaW4gdjU6Cj4+IC0gUmViYXNlIG9uIHRvcCBvZiA2LjE2LXJj
MQo+Pgo+PiBDaGFuZ2VzIGluIHY0Ogo+PiAtIFJlYmFzZSBvbiB0b3Agb2YgZm9yLW5leHQgKG9u
IHRvcCBvZiA2LjE1LXJjNikKPj4KPj4gQ2hhbmdlcyBpbiB2MzoKPj4gLSBGaXggcGF0Y2ggMiB3
aGljaCBjYXVzZWQgYnVpbGQgZmFpbHVyZXMgKGxpbnV4IHJpc2N2IGJvdCksIGJ1dCB0aGUKPj4g
ICAgcGF0Y2hzZXQgaXMgZXhhY3RseSB0aGUgc2FtZSBhcyB2Mgo+Pgo+PiBDaGFuZ2VzIGluIHYy
Ogo+PiAtIFJlYmFzZSBvbiB0b3Agb2YgNi4xNS1yYzUKPj4gLSBBZGQgUkIgdGFncwo+PiAtIERl
ZmluZSBSVl9YKCkgdXNpbmcgUlZfWF9tYXNrKCkgKENsw6ltZW50KQo+PiAtIFJlbW92ZSB1bnVz
ZWQgZGVmaW5lcyAoQ2zDqW1lbnQpCj4+IC0gRml4IHRhYnVsYXRpb25zIChEcmV3KQo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4+
IC0tLQo+PiBBbGV4YW5kcmUgR2hpdGkgKDMpOgo+PiAgICAgICAgcmlzY3Y6IEZpeCB0eXBvIEVY
UkFDVCAtPiBFWFRSQUNUCj4+ICAgICAgICByaXNjdjogU3RyZW5ndGhlbiBkdXBsaWNhdGUgYW5k
IGluY29uc2lzdGVudCBkZWZpbml0aW9uIG9mIFJWX1goKQo+PiAgICAgICAgcmlzY3Y6IE1vdmUg
YWxsIGR1cGxpY2F0ZSBpbnNuIHBhcnNpbmcgbWFjcm9zIGludG8gYXNtL2luc24uaAo+Pgo+PiAg
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi5oICAgICAgICAgIHwgMjA2ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrLS0tLQo+PiAgIGFyY2gvcmlzY3Yva2VybmVsL21hY2hpbmVfa2V4
ZWNfZmlsZS5jIHwgICAyICstCj4+ICAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25l
ZC5jICAgfCAxNDQgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gICBhcmNoL3Jpc2N2L2tlcm5l
bC92ZWN0b3IuYyAgICAgICAgICAgICB8ICAgMiArLQo+PiAgIGFyY2gvcmlzY3Yva3ZtL3ZjcHVf
aW5zbi5jICAgICAgICAgICAgIHwgMTI4ICstLS0tLS0tLS0tLS0tLS0tLS0tCj4+ICAgNSBmaWxl
cyBjaGFuZ2VkLCAxODggaW5zZXJ0aW9ucygrKSwgMjk0IGRlbGV0aW9ucygtKQo+PiAtLS0KPj4g
YmFzZS1jb21taXQ6IDczMWU5OThjNDI5OTc0Y2IxNDFhMDQ5YzEzNDdhOWNhYjQ0NGU0NGMKPj4g
Y2hhbmdlLWlkOiAyMDI1MDYyMC1kZXYtYWxleC1pbnNuX2R1cGxpY2F0ZV92NV9tYW51YWwtMmMy
MzE5MWMzMGZiCj4+Cj4+IEJlc3QgcmVnYXJkcywKPiBIaSBBbGV4LAo+Cj4gSSBhbHJlYWR5IGdh
dmUgbXkgUmV2aWV3ZWQtYnkgZm9yIHRoZSBsYXN0IHR3byBjb21taXRzIG9mIHRoaXMgc2VyaWVz
IGluIFY0LgoKClNvcnJ5LCBJJ2xsIGFkZCB0aGVtIHdoZW4gSSBtZXJnZSB0aGlzIHBhdGNoc2V0
LgoKVGhhbmtzLAoKQWxleAoKCj4gVGhhbmtzLAo+Cj4gQ2zDqW1lbnQKPgo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCi0tIAprdm0tcmlzY3Yg
bWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
