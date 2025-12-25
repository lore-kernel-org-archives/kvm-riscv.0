Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DA9E7AD42
	for <kvm-riscv@archiver.kernel.org>; Thu, 25 Dec 2025 10:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/jjdReov17U1JQthLgPmMIQakvNsFTkt9z6Vn84kqBo=; b=LHKT2poneM9e+B
	UX3TBXHlvORD3bVv0fJirHkWZntxPFvg4QBEKwgwiyNX7svUgmeOQ2emqVmq+rAoDSO4aUOvpNyrO
	U9HX7XLUTV2vRWXljXdhjufvbQ+JzwUWcoHhjQ60rYnWZkC+xH+fIpWCaOWb5eyqNiEyeb5kf0/ud
	D9sLGWaU5npElSDWd2cme8M51ncpujQi9Aou0RSGULeRK6rTReLEXWAOqGJ54sCwZj2bEcjj/d9my
	MIiOovo1fhtMnQfDE+28AbGvViRqFcmRiWbaz8rTGi3AOkOEuGY7k2xfzYUKwmeRH/AaL6D/8P4Td
	iHa+mvMjmbjgoZ4kEGSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYiN3-00000000JZJ-0umB;
	Thu, 25 Dec 2025 10:15:01 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYiMs-00000000JYB-3q6N;
	Thu, 25 Dec 2025 10:14:58 +0000
Received: from [192.168.0.105] (unknown [114.241.82.59])
	by APP-01 (Coremail) with SMTP id qwCowACH826RDk1pT2zJAQ--.26576S2;
	Thu, 25 Dec 2025 18:14:42 +0800 (CST)
Message-ID: <38ce44c1-08cf-4e3f-8ade-20da224f529c@iscas.ac.cn>
Date: Thu, 25 Dec 2025 18:14:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 06/14] riscv: misaligned: request misaligned exception
 from SBI
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
 Andrew Jones <ajones@ventanamicro.com>, Deepak Gupta <debug@rivosinc.com>,
 Charlie Jenkins <charlie@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-7-cleger@rivosinc.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20250523101932.1594077-7-cleger@rivosinc.com>
X-CM-TRANSID: qwCowACH826RDk1pT2zJAQ--.26576S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww4UuF4kAF45WFy8Kw13CFg_yoW8Xr48pF
	s5Gr4akrW5CrnFq3W3uwnFqF4Yvw4rGr4xJrsrJ343urs8Zr4FvF4ktF1DXa47JrWkuw10
	gFy3Kr1rua4DZrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07jDsqXUUUUU=
X-Originating-IP: [114.241.82.59]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_021451_412893_76AD4B88 
X-CRM114-Status: UNSURE (   8.42  )
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

SGnCoENsw6ltZW50IGFuZCByaXNjdiBtYWludGFpbmVyczoKCk9uIDUvMjMvMjUgMTg6MTksIENs
w6ltZW50IEzDqWdlciB3cm90ZToKPiBOb3cgdGhhdCB0aGUga2VybmVsIGNhbiBoYW5kbGUgbWlz
YWxpZ25lZCBhY2Nlc3NlcyBpbiBTLW1vZGUsIHJlcXVlc3QKPiBtaXNhbGlnbmVkIGFjY2VzcyBl
eGNlcHRpb24gZGVsZWdhdGlvbiBmcm9tIFNCSS4gVGhpcyB1c2VzIHRoZSBGV0ZUIFNCSQo+IGV4
dGVuc2lvbiBkZWZpbmVkIGluIFNCSSB2ZXJzaW9uIDMuMC4KPgo+IFNpZ25lZC1vZmYtYnk6IENs
w6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPiBSZXZpZXdlZC1ieTogQW5kcmV3
IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9jcHVmZWF0dXJlLmggICAgICAgIHwgIDMgKy0KPiAgYXJjaC9yaXNjdi9rZXJuZWwv
dHJhcHNfbWlzYWxpZ25lZC5jICAgICAgIHwgNzEgKysrKysrKysrKysrKysrKysrKysrLQo+ICBh
cmNoL3Jpc2N2L2tlcm5lbC91bmFsaWduZWRfYWNjZXNzX3NwZWVkLmMgfCAgOCArKy0KPiAgMyBm
aWxlcyBjaGFuZ2VkLCA3NyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKVGhpcyBjYXVz
ZXMgYSByZWdyZXNzaW9uIG9uIHBsYXRmb3JtcyB3aGVyZSB2ZWN0b3IgbWlzYWxpZ25lZCBhY2Nl
c3MgY2FuCmJlIGVtdWxhdGVkIHdpdGggT3BlblNCSSAoc2luY2UgT3BlblNCSSBjb21taXQgYzJh
Y2M1ZSAoImxpYjoKc2JpX21pc2FsaWduZWRfbGRzdDogQWRkIGhhbmRsaW5nIG9mIHZlY3RvciBs
b2FkL3N0b3JlIiksIGJlY2F1c2UgdGhpcwpkaXNhYmxlcyB0aGF0IHdpdGggRldGVC4gVGhpcyBt
ZWFucyB0aGF0IHZlY3RvciBtaXNhbGlnbmVkIGxvYWRzIGFuZApzdG9yZXMgdGhhdCB3ZXJlIGVt
dWxhdGVkIGluc3RlYWQgZ2V0IGEgU0lHQlVTLgoKVGhpcyBoYXBwZW5zIG9uIFNvcGhnbyBTRzIw
NDQgYW5kIFNwYWNlbWlUIEsxLiBOb3RhYmx5IHRoaXMgY2F1c2VzIHRoZXNlCnBsYXRmb3JtcyB0
byBmYWlsIFppY2Nsc20gd2hpY2ggc3RpcHVsYXRlcyB0aGF0IG1pc2FsaWduZWQgdmVjdG9yIG1l
bW9yeQphY2Nlc3NlcyBzdWNjZWVkIGlmIHZlY3RvciBpbnN0cnVjdGlvbnMgYXJlIGF2YWlsYWJs
ZSBhdCBhbGwgWzFdLgoKSSdtIG5vdCB2ZXJ5IGNlcnRhaW4gd2h5IHZlY3RvciBlbXVsYXRpb24g
c3VwcG9ydCB3YXMgb21pdHRlZCBpbiB0aGlzCnNlcmllcy4gU2hvdWxkIHdlIHBlcmhhcHMgYWRk
IHRoZSBzYW1lIGVtdWxhdGlvbiBzdXBwb3J0IHRvIExpbnV4IGFzCndlbGwgZm9yIHRoZSBzYWtl
IG9mIHRoZXNlIGtpbmQgb2YgcGxhdGZvcm1zPwoKVGhhbmtzLApWaXZpYW4gImRyYW1mb3JldmVy
IiBXYW5nCgpbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1wcm9maWxlcy9pc3N1
ZXMvNTgKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1y
aXNjdgo=
