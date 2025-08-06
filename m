Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CE8C87FCB
	for <kvm-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 10:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Cc:In-Reply-To:References:
	Message-Id:From:To:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tTJZD0TRqmskI0llANhKquKTYl0BBWMcmvIbhJqyZtg=; b=34dS+Xq35232hC
	VZhEy28k5UfH5KoIxs/borqrZc/iajaLfaA5Q7VUBBCHhCOUGwPVjxZ/PIbtxfuJkVSuXzycJRthD
	0HebFGs577SaYfwUPbs+DySszmMgBbOSXR4mLMzTh+ewJ3xJWOF6m3L0n8mgWM45AA9zzac6zlYg4
	QFclim1BgGq0AabEFZU10HwFG3gngL7qQlGIZjUn5m+n7cqRTVHCzrD8g9DVJkz3bw/5wPA3IjxWe
	LublRCtkM+Rb3BHMVcWXiB3Ogu6MkGfv0nWzz9wYEshEhgjzMzcXxHJOokpmysnYO+7ggnmrNPoFU
	DmO4oTYCBBoeSgqP9urA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujb1I-0000000Eqwm-27Sv;
	Wed, 06 Aug 2025 10:05:16 +0000
Received: from sg-1-22.ptr.blmpb.com ([118.26.132.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujb1F-0000000Eqvh-0k3b
	for kvm-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 10:05:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1754474707;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=HAuif9gFjp03a1ED0sRYhN2Xh+Oo5vYjt6vdU6y4qaw=;
 b=TXTmBTe33mszmANQficYSPl82udgMtn/ERcp3bvHMULbkLB+iKJfuYQ8Q9FGac5AsEtR3a
 K6GACDuM8lcDfkiBMHfyQQoKdWjXI5NIT5F97VfnNr30VqCHY5P8N7o6h2KNb4uES9KOGj
 U9CqhvjdIKvBrxBpFkKLP90Or0vwvgWWuclFafJol5k9B2fnfVwOstmjHY0L6faXSTamF5
 wVIa2GXEHx0Nn7QYYwPCeIB55n7qgThSfM7PPoehSYdD2hRCXqqAj9PC9uCnEhqfyGGOFh
 hIDEoQzMGvWqmsVPmct0tQmOGBvQIjcNAHSxhgetQwUmToDE1mnMZDQztODsHw==
Mime-Version: 1.0
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
To: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
	<kvm-riscv@lists.infradead.org>
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
User-Agent: Mozilla Thunderbird
Message-Id: <3d7df3b0-27c5-47a2-a4a1-dde168e7848e@lanxincomputing.com>
References: <20250805104418.196023-4-rkrcmar@ventanamicro.com>
In-Reply-To: <20250805104418.196023-4-rkrcmar@ventanamicro.com>
Content-Language: en-US
Cc: <kvm@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, "Anup Patel" <anup@brainfault.org>, 
	"Atish Patra" <atishp@atishpatra.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Daniel Henrique Barboza" <dbarboza@ventanamicro.com>, 
	<stable@vger.kernel.org>
Subject: Re: [PATCH] RISC-V: KVM: fix stack overrun when loading vlenb
Date: Wed, 6 Aug 2025 18:05:02 +0800
X-Lms-Return-Path: <lba+2689328d1+575897+lists.infradead.org+liujingqi@lanxincomputing.com>
Received: from [127.0.0.1] ([116.237.111.137]) by smtp.feishu.cn with ESMTPS; Wed, 06 Aug 2025 18:05:03 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_030513_386532_03459807 
X-CRM114-Status: UNSURE (   9.43  )
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

T24gOC81LzIwMjUgNjo0NCBQTSwgUmFkaW0gS3LEjW3DocWZIHdyb3RlOgo+IFRoZSB1c2Vyc3Bh
Y2UgbG9hZCBjYW4gcHV0IHVwIHRvIDIwNDggYml0cyBpbnRvIGFuIHhsZW4gYml0IHN0YWNrCj4g
YnVmZmVyLiAgV2Ugd2FudCBvbmx5IHhsZW4gYml0cywgc28gY2hlY2sgdGhlIHNpemUgYmVmb3Jl
aGFuZC4KPgo+IEZpeGVzOiAyZmEyOTAzNzJkZmUgKCJSSVNDLVY6IEtWTTogYWRkICd2bGVuYicg
VmVjdG9yIENTUiIpCj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYt
Ynk6IFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPgo+IC0tLQpSZXZp
ZXdlZC1ieTogTnV0dHkgTGl1IDxsaXVqaW5ncWlAbGFueGluY29tcHV0aW5nLmNvbT4KClRoYW5r
cywKTnV0dHkKPiAgIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfdmVjdG9yLmMgfCAyICsrCj4gICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
dm0vdmNwdV92ZWN0b3IuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdmVjdG9yLmMKPiBpbmRleCBh
NWY4OGNiNzE3ZjMuLjA1ZjNjYzJkOGUzMSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92
Y3B1X3ZlY3Rvci5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYwo+IEBAIC0x
ODIsNiArMTgyLDggQEAgaW50IGt2bV9yaXNjdl92Y3B1X3NldF9yZWdfdmVjdG9yKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSwKPiAgIAkJc3RydWN0IGt2bV9jcHVfY29udGV4dCAqY250eCA9ICZ2Y3B1
LT5hcmNoLmd1ZXN0X2NvbnRleHQ7Cj4gICAJCXVuc2lnbmVkIGxvbmcgcmVnX3ZhbDsKPiAgIAo+
ICsJCWlmIChyZWdfc2l6ZSAhPSBzaXplb2YocmVnX3ZhbCkpCj4gKwkJCXJldHVybiAtRUlOVkFM
Owo+ICAgCQlpZiAoY29weV9mcm9tX3VzZXIoJnJlZ192YWwsIHVhZGRyLCByZWdfc2l6ZSkpCj4g
ICAJCQlyZXR1cm4gLUVGQVVMVDsKPiAgIAkJaWYgKHJlZ192YWwgIT0gY250eC0+dmVjdG9yLnZs
ZW5iKQoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlz
Y3YK
