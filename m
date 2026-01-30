Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF2BE6BF0B
	for <kvm-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 13:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=odg3FwMmZqQne98frXvqeZJGrDKRNPlrryCu3a91/Bo=; b=OzRNSYMLthrxCX
	IQH6swKM0oA9vSrMAzJY6N59Djjtb2YwLu0+toHrvaIRACqBkCcm5T3MjA6CaUgQ724Rs6rxK+E2F
	5faE9ppu5TWVP55C0m0OEKJbKuxYyq6Yr/w0W6kubigt3v8JCvdIZlB71SOTylmHbwKaKIX+/CAMj
	yPPhriX8TbjGciyeGL1vmHpHUAtWsR22gfHVO6JKVFyRaCMzPR2ApGVcim6ZGPaGmcWjPVOjrBgab
	SOE8dBMtvz5kPb7af8nBemvK1tkrnPftPG93Pn5IAohbtYA4uSXLQCIZgMZuCN145HqebNPFB1YCA
	gHfGdoHk+sPJO/SlDFwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vloUz-00000001Wh1-10j7;
	Fri, 30 Jan 2026 13:25:21 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vloUv-00000001WgV-25ce;
	Fri, 30 Jan 2026 13:25:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1769779508; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=RozGlFaTYGMc2+qnEcfwrS17KdH/KSz4VErfc5KgN2Q=;
	b=ev2CFmfKhrr4N3zpxtisegusL9/HBg6dRSjihYEJUmAdpidCmcD15CH1Ce02ZueUUxT7DQSivKxMRiQ5eE/6yYDp/KmtVBih91C7Ea6QlYwOr1kPRDVjZM9wHW3Ol8nMWVt4oY2DdL83lYEDdQSQ6ABBsQedKeoee1YIRF7GdQY=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WyAvvCj_1769779501 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 30 Jan 2026 21:25:03 +0800
From: fangyu.yu@linux.alibaba.com
To: radim.krcmar@oss.qualcomm.com
Cc: ajones@ventanamicro.com,
	alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	corbet@lwn.net,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pbonzini@redhat.com,
	pjw@kernel.org
Subject: Re: Re: [PATCH v3 1/2] RISC-V: KVM: Support runtime configuration for per-VM's HGATP mode 
Date: Fri, 30 Jan 2026 21:24:58 +0800
Message-Id: <20260130132458.16367-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <DG16GDMKZOBM.2QH3ZYM2WH7RO@oss.qualcomm.com>
References: <DG16GDMKZOBM.2QH3ZYM2WH7RO@oss.qualcomm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_052518_270463_8ACB6A0E 
X-CRM114-Status: GOOD (  14.85  )
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

Pj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20+Cj4+Cj4+IElu
dHJvZHVjZXMgb25lIHBlci1WTSBhcmNoaXRlY3R1cmUtc3BlY2lmaWMgZmllbGRzIHRvIHN1cHBv
cnQgcnVudGltZQo+PiBjb25maWd1cmF0aW9uIG9mIHRoZSBHLXN0YWdlIHBhZ2UgdGFibGUgZm9y
bWF0Ogo+Pgo+PiAtIGt2bS0+YXJjaC5rdm1fcmlzY3ZfZ3N0YWdlX3BnZF9sZXZlbHM6IHRoZSBj
b3JyZXNwb25kaW5nIG51bWJlciBvZiBwYWdlCj4+ICAgdGFibGUgbGV2ZWxzIGZvciB0aGUgc2Vs
ZWN0ZWQgbW9kZS4KPj4KPj4gVGhlc2UgZmllbGRzIHJlcGxhY2UgdGhlIHByZXZpb3VzIGdsb2Jh
bCB2YXJpYWJsZXMKPj4ga3ZtX3Jpc2N2X2dzdGFnZV9tb2RlIGFuZCBrdm1fcmlzY3ZfZ3N0YWdl
X3BnZF9sZXZlbHMsIGVuYWJsaW5nIGRpZmZlcmVudAo+PiB2aXJ0dWFsIG1hY2hpbmVzIHRvIGlu
ZGVwZW5kZW50bHkgc2VsZWN0IHRoZWlyIEctc3RhZ2UgcGFnZSB0YWJsZSBmb3JtYXQKPj4gaW5z
dGVhZCBvZiBiZWluZyBmb3JjZWQgdG8gc2hhcmUgdGhlIG1heGltdW0gbW9kZSBkZXRlY3RlZCBi
eSB0aGUga2VybmVsCj4+IGF0IGJvb3QgdGltZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRmFuZ3l1
IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20+Cj4+IC0tLQo+PiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9rdm1faG9zdC5oCj4+IEBAIC04Nyw2ICs4NywyMiBAQCBzdHJ1Y3Qga3ZtX3ZjcHVfc3RhdCB7
Cj4+ICBzdHJ1Y3Qga3ZtX2FyY2hfbWVtb3J5X3Nsb3Qgewo+PiAgfTsKPj4gIAo+PiArc3RhdGlj
IGlubGluZSB1bnNpZ25lZCBsb25nIGt2bV9yaXNjdl9nc3RhZ2VfbW9kZSh1bnNpZ25lZCBsb25n
IHBnZF9sZXZlbHMpCj4+ICt7Cj4+ICsJc3dpdGNoIChwZ2RfbGV2ZWxzKSB7Cj4+ICsJY2FzZSAy
Ogo+PiArCQlyZXR1cm4gSEdBVFBfTU9ERV9TVjMyWDQ7Cj4+ICsJY2FzZSAzOgo+PiArCQlyZXR1
cm4gSEdBVFBfTU9ERV9TVjM5WDQ7Cj4+ICsJY2FzZSA0Ogo+PiArCQlyZXR1cm4gSEdBVFBfTU9E
RV9TVjQ4WDQ7Cj4+ICsJY2FzZSA1Ogo+PiArCQlyZXR1cm4gSEdBVFBfTU9ERV9TVjU3WDQ7Cj4+
ICsJZGVmYXVsdDoKPj4gKwkJcmV0dXJuIEhHQVRQX01PREVfT0ZGOwo+Cj5JIHRoaW5rIGRlZmF1
bHQgc2hvdWxkIGJlIGFuIGludGVybmFsIGVycm9yLgo+V2UgY2FuIGRvICJjYXNlIDA6IHJldHVy
biBIR0FUUF9NT0RFX09GRjsiLCBvciBqdXN0IGVycm9yIGl0IHRvbyBzaW5jZQo+S1ZNIHNob3Vs
ZG4ndCBldmVyIGFzayBmb3IgbW9kZSB3aXRob3V0IHByb3RlY3Rpb24gYW55d2F5LgoKR29vZCBw
b2ludC4gUmV0dXJuaW5nIEhHQVRQX01PREVfT0ZGIGluIHRoZSBkZWZhdWx0IGNhc2Ugd291bGQg
aGlkZSBhbgppbnRlcm5hbCBidWcgKHVuZXhwZWN0ZWQgcGdkX2xldmVscykuIEnigJlsbCB0cmVh
dCBpdCBhcyBhbiBpbnRlcm5hbCBlcnJvcgppbnN0ZWFkLCBTb21ldGhpbmcgbGlrZToKICAgIGRl
ZmF1bHQ6CiAgICAgICAgV0FSTl9PTl9PTkNFKDEpOwogICAgICAgIHJldHVybiBIR0FUUF9NT0RF
X09GRjsKICAgIH0KCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYyBiL2Fy
Y2gvcmlzY3Yva3ZtL2dzdGFnZS5jCj4+IEBAIC0zMTksNDEgKzMyMSw0OCBAQCB2b2lkIF9faW5p
dCBrdm1fcmlzY3ZfZ3N0YWdlX21vZGVfZGV0ZWN0KHZvaWQpCj4+ICt1bnNpZ25lZCBsb25nIGt2
bV9yaXNjdl9nc3RhZ2VfZ3BhX2JpdHMoc3RydWN0IGt2bV9hcmNoICprYSkKPj4gK3sKPj4gKwly
ZXR1cm4gKEhHQVRQX1BBR0VfU0hJRlQgKwo+PiArCQlrYS0+a3ZtX3Jpc2N2X2dzdGFnZV9wZ2Rf
bGV2ZWxzICoga3ZtX3Jpc2N2X2dzdGFnZV9pbmRleF9iaXRzICsKPj4gKwkJa3ZtX3Jpc2N2X2dz
dGFnZV9wZ2RfeGJpdHMpOwo+PiArfQo+PiArCj4+ICtncGFfdCBrdm1fcmlzY3ZfZ3N0YWdlX2dw
YV9zaXplKHN0cnVjdCBrdm1fYXJjaCAqa2EpCj4+ICt7Cj4+ICsJcmV0dXJuIEJJVF9VTEwoa3Zt
X3Jpc2N2X2dzdGFnZV9ncGFfYml0cyhrYSkpOwo+PiArfQo+Cj5QbGVhc2UgZGVmaW5lIHRoZXNl
IHR3byBmdW5jdGlvbnMgYXMgc3RhdGljIGlubGluZSBpbiB0aGUgaGVhZGVyIGZpbGVzLgo+VGhl
eSB1c2VkIHRvIGJlIGp1c3QgbWFjcm9zIHRoZXJlLCBzbyBpdCdkIGJlIHNhZmVyIG5vdCBwdXQg
TFRPIGludG8gdGhlCj5lcXVhdGlvbi4KCkFncmVlZC4KCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2t2bS9tYWluLmMgYi9hcmNoL3Jpc2N2L2t2bS9tYWluLmMKPj4gQEAgLTEwNSwxNyArMTA1
LDE3IEBAIHN0YXRpYyBpbnQgX19pbml0IHJpc2N2X2t2bV9pbml0KHZvaWQpCj4+ICAJCXJldHVy
biByYzsKPj4gIAo+PiAgCWt2bV9yaXNjdl9nc3RhZ2VfbW9kZV9kZXRlY3QoKTsKPj4gLQlzd2l0
Y2ggKGt2bV9yaXNjdl9nc3RhZ2VfbW9kZSkgewo+PiAtCWNhc2UgSEdBVFBfTU9ERV9TVjMyWDQ6
Cj4+ICsJc3dpdGNoIChrdm1fcmlzY3ZfZ3N0YWdlX21heF9wZ2RfbGV2ZWxzKSB7Cj4+ICsJY2Fz
ZSAyOgo+PiAgCQlzdHIgPSAiU3YzMng0IjsKPj4gIAkJYnJlYWs7Cj4+IC0JY2FzZSBIR0FUUF9N
T0RFX1NWMzlYNDoKPj4gKwljYXNlIDM6Cj4+ICAJCXN0ciA9ICJTdjM5eDQiOwo+PiAgCQlicmVh
azsKPj4gLQljYXNlIEhHQVRQX01PREVfU1Y0OFg0Ogo+PiArCWNhc2UgNDoKPj4gIAkJc3RyID0g
IlN2NDh4NCI7Cj4+ICAJCWJyZWFrOwo+PiAtCWNhc2UgSEdBVFBfTU9ERV9TVjU3WDQ6Cj4+ICsJ
Y2FzZSA1Ogo+PiAgCQlzdHIgPSAiU3Y1N3g0IjsKPj4gIAkJYnJlYWs7Cj4+ICAJZGVmYXVsdDoK
Pj4gQEAgLTE2NCw3ICsxNjQsNyBAQCBzdGF0aWMgaW50IF9faW5pdCByaXNjdl9rdm1faW5pdCh2
b2lkKQo+PiAgCQkJIChyYykgPyBzbGlzdCA6ICJubyBmZWF0dXJlcyIpOwo+PiAgCX0KPj4gIAo+
PiAtCWt2bV9pbmZvKCJ1c2luZyAlcyBHLXN0YWdlIHBhZ2UgdGFibGUgZm9ybWF0XG4iLCBzdHIp
Owo+PiArCWt2bV9pbmZvKCJNYXggRy1zdGFnZSBwYWdlIHRhYmxlIGZvcm1hdCAlc1xuIiwgc3Ry
KTsKPgo+RnVuIGZhY3Q6IHRoZSBJU0EgZG9lc24ndCBkZWZpbmUgdGhlIHNhbWUgaGllcmFyY2h5
IGZvciBoZ2F0cCBtb2RlcyBhcwo+aXQgZG9lcyBmb3Igc2F0cCBtb2Rlcywgc28gd2UgY291bGQg
aGF2ZSBqdXN0IFN2NTd4NCBhbmQgbm90aGluZyBiZWxvdy4KPgo+V2UgY291bGQgZG8ganVzdCB3
aXRoIGEgY29kZSBjb21tZW50IHRoYXQgd2UncmUgYXNzdW1pbmcgdmVuZG9ycyB3aWxsIGRvCj5i
ZXR0ZXIsIGJ1dCBJJ2QgcmF0aGVyIG5vdCBpbnRyb2R1Y2UgbW9yZSBhc3N1bXB0aW9ucy4uLgo+
SSB0aGluayB0aGUgZWFzaWVzdCB3b3VsZCBiZSB0byBrdm1fcmlzY3ZfZ3N0YWdlX21vZGVfZGV0
ZWN0KCkgbGV2ZWxzIGluCj5yZXZlcnNlIGFuZCBzdG9wIG9uIHRoZSBmaXJzdCBvbmUgdGhhdCBp
cyBub3Qgc3VwcG9ydGVkLgo+KEknbGwgcmVwbHkgd2l0aCBhIHBhdGNoIGxhdGVyLikKClBsZWFz
ZSByZWZlciB0byB0aGUgZGlzY3Vzc2lvbiBoZXJlOgpodHRwczovL2dpdGh1Yi5jb20vcmlzY3Yv
cmlzY3YtaXNhLW1hbnVhbC9pc3N1ZXMvMjIwOApJZiBTdjU3eDQgaXMgaW1wbGVtZW50ZWQsIHRo
ZW4gU3Y0OHg0IGFuZCBTdjM5eDQgbXVzdCBhbHNvIGJlIGltcGxlbWVudGVkLgoKPlRoYW5rcy4K
ClRoYW5rcywKRmFuZ3l1CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2t2bS1yaXNjdgo=
