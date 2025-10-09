Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1028CCA470
	for <kvm-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 10:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+oAWjfSNOjv+JGRa6gKrIp8mTeh3ikLNcbf/S0U+sts=; b=YAJj6jGp9CmaNu
	2txj+pmegYWebIIdqeeePN4Iv2W4Ynq9qTnpQxRaj6cjST3fJSS287ooDeOdqLS61Ast80Qk26DAB
	hrd18WDCxEBIKmS5dXp+blH2ApfZyP8LNvo1FFCudxvOALSvT0pW2zLwRIGxixnGqnDg7H8BI4mfN
	J+Mwd6SpoLzTwFnSecnGTnzcr6TIduL5RYWgcz1FSuM3ILCLLjdAaVOnoG9e23nRkNMk27TL0nxwy
	LhwzzAo34OgHwoxkjvW2WKdwHAAzOtjCR8RpSTYMvtTBmf9cgRuQW7LOzdzeV4f8fwKl0Fe6rZFIc
	LpJ/z6vJHKOCYefRiikQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6nk3-00000005lqJ-1zXy;
	Thu, 09 Oct 2025 10:19:23 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6njr-00000005loA-1EZ9;
	Thu, 09 Oct 2025 10:19:21 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 599AFpSq031528
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Thu, 9 Oct 2025 18:15:51 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 9 Oct
 2025 18:15:51 +0800
Date: Thu, 9 Oct 2025 18:15:51 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
CC: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <liujingqi@lanxincomputing.com>, <kvm@vger.kernel.org>,
        <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <tim609@andestech.com>,
        Hui Min Mina Chou
	<minachou@andestech.com>,
        linux-riscv
	<linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH] RISC-V: KVM: flush VS-stage TLB after VCPU migration to
 prevent stale entries
Message-ID: <aOeLVwXW/sF4NBUJ@atctrx.andestech.com>
References: <20251002033402.610651-1-ben717@andestech.com>
 <DDDKX1VNCCVS.2KVYNU4WBEOVI@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DDDKX1VNCCVS.2KVYNU4WBEOVI@ventanamicro.com>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-Originating-IP: [10.0.15.173]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 599AFpSq031528
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_031911_684727_B39E7D0E 
X-CRM114-Status: GOOD (  16.69  )
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

SGkgUmFkaW0sCgpUaGFua3MgZm9yIHRoZSByZXZpZXcgYW5kIHRoZSBkZXRhaWxlZCBjb21tZW50
cy4KCj4gV2hhdCBSSVNDLVYgaW1wbGVtZW50YXRpb24gYXJlIHlvdSB1c2luZz8gIChBbmQgZG9l
cyB0aGUgaW1wbGVtZW50YXRpb24KPiBoYXZlIHRoZSBzYW1lIG1lbW9yeSBhY2Nlc3MgcGVyZm9y
bWFuY2UgaW4gVj0wIGFuZCBWPTEgbW9kZXMsIGV2ZW4KPiB0aG91Z2ggdGhlIGxhdHRlciBoYXMg
dHdvIGxldmVscyBvZiBUTEJzPykKPiAKClRoZSBpc3N1ZSBpcyBmb3VuZCB3aGVuIHZhbGlkYXRp
bmcgb3VyIG5ldyBBbmRlc0NvcmUgQVg2Ni4KVGhlIGFkZHJlc3MgdHJhbnNsYXRpb24gcGVyZm9y
bWFuY2UgaXMgdGhlIHNhbWUgZm9yIFUgYW5kIFZVLW1vZGUgd2hlbiB0aGUgdVRMQiBpcyBoaXQu
Cgo+ID4gVG8gZml4IHRoaXMsIGt2bV9yaXNjdl9nc3RhZ2Vfdm1pZF9zYW5pdGl6ZSgpIGlzIGV4
dGVuZGVkIHRvIGZsdXNoIGJvdGgKPiA+IEctc3RhZ2UgYW5kIFZTLXN0YWdlIFRMQnMgd2hlbmV2
ZXIgYSBWQ1BVIG1pZ3JhdGVzIHRvIGEgZGlmZmVyZW50IEhvc3QgQ1BVLgo+ID4gVGhpcyBlbnN1
cmVzIHRoYXQgbm8gc3RhbGUgVlMtc3RhZ2UgbWFwcGluZ3MgcmVtYWluIGFmdGVyIFZDUFUgbWln
cmF0aW9uLgo+ID4KPiA+IEZpeGVzOiBiNzliZjIwMjVkYmMgKCJSSVNDLVY6IEtWTTogUmVuYW1l
IGFuZCBtb3ZlIGt2bV9yaXNjdl9sb2NhbF90bGJfc2FuaXRpemUoKSIpCj4gCj4gYjc5YmYyMDI1
ZGJjIGRvZXMgbm90IGNoYW5nZSBiZWhhdmlvci4KPiBUaGUgYnVnIG11c3QgaGF2ZSBiZWVuIGlu
dHJvZHVjZWQgZWFybGllci4KPiAKCldpbGwgZml4IHRoZSBpbmNvcnJlY3QgRml4ZXMgdGFnIGlu
IHRoZSBuZXh0IHZlcnNpb24uClRoYW5rcyBmb3IgcG9pbnRpbmcgdGhhdCBvdXQsIHdlJ2xsIGNo
YW5nZSB0byB0aGUgZm9sbG93aW5nOgoKICAgIEZpeGVzOiA5MmU0NTA1MDdkNTYgKCJSSVNDLVY6
IEtWTTogQ2xlYW51cCBzdGFsZSBUTEIgZW50cmllcyB3aGVuIGhvc3QgQ1BVIGNoYW5nZXMiKQoK
PiA+IFNpZ25lZC1vZmYtYnk6IEh1aSBNaW4gTWluYSBDaG91IDxtaW5hY2hvdUBhbmRlc3RlY2gu
Y29tPgo+ID4gU2lnbmVkLW9mZi1ieTogQmVuIFpvbmctWW91IFhpZSA8YmVuNzE3QGFuZGVzdGVj
aC5jb20+Cj4gPiAtLS0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92bWlkLmMgYi9h
cmNoL3Jpc2N2L2t2bS92bWlkLmMKPiA+IEBAIC0xNDYsNCArMTQ2LDEwIEBAIHZvaWQga3ZtX3Jp
c2N2X2dzdGFnZV92bWlkX3Nhbml0aXplKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAKPiBUaGUg
ZnVuY3Rpb24gaXMgbm93IGRvaW5nIG1vcmUgdGhhdCBzYW5pdGl6aW5nIGdzdGFnZS4KPiBNYXli
ZSB3ZSBjYW4gYWdhaW4gY2FsbCBpdCBrdm1fcmlzY3ZfbG9jYWxfdGxiX3Nhbml0aXplKCk/Cj4g
CgpBcyBmb3IgdGhlIG5hbWluZywgeW91ciBzdWdnZXN0aW9uIG1ha2VzIHNlbnNlLgpXZeKAmXJl
IGFsc28gY29uc2lkZXJpbmcgd2hldGhlciBpdCBzaG91bGQgYmUgbW92ZWQgYmFjayBmcm9tIHZt
aWQuYyB0byB0bGIuYywKYW5kIHdl4oCZZCBsaWtlIHRvIGhlYXIgb3RoZXIgbWFpbnRhaW5lcnPi
gJkgb3BpbmlvbnMgYmVmb3JlIGRvaW5nIHNvLgoKVGhhbmtzIGFnYWluIGZvciB5b3VyIGZlZWRi
YWNrLgoKQmVzdCByZWdhcmRzLApCZW4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
