Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BE9FEE4CA
	for <kvm-riscv@archiver.kernel.org>; Sat, 28 Feb 2026 06:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VYdemjFCQV5OUcLG3ib32XyG83xBhVxGfiawyid/6zU=; b=rAaU4BvzGx7jyA
	XegMEc1OyDCDRUbdSrRtp1O00/zOqgT0kZ8j8cgbUNH54/T3dRm/Hq6oc+tCjqtiDHIhxEbgASL6S
	gec9PLZyuZkqZlg4kms9Uf3FzRX17s+vqamq0hqchYQWOX7kXSLnkQZMn6FSNe4gPRvHG6z43wHq9
	Hbs5uVMZLevR7pxIGw6J58+xK8q6U9AMLNjUp5PIEvzagqvildMyehtIOyuNJi62TlcIIavK/bhRm
	uflklgsEUsGQ8D5LIct8drgq4dYAVNiIyDl33rKbV0yIRXwjBxig2axOox1ITzizuZ+cFrxX/S4PJ
	T1yxSvIlMPvyGzeIK/oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwDqf-00000009Y8G-1AMy;
	Sat, 28 Feb 2026 06:30:45 +0000
Received: from smtp37.cstnet.cn ([159.226.251.37] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwDqb-00000009Y7l-0JpM;
	Sat, 28 Feb 2026 06:30:43 +0000
Received: from xujiakai2025$iscas.ac.cn ( [210.73.43.101] ) by
 ajax-webmail-APP-12 (Coremail) ; Sat, 28 Feb 2026 14:30:25 +0800
 (GMT+08:00)
X-Originating-IP: [210.73.43.101]
Date: Sat, 28 Feb 2026 14:30:25 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Jiakai Xu" <xujiakai2025@iscas.ac.cn>
To: "kernel test robot" <lkp@intel.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	kvm@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	"Alexandre Ghiti" <alex@ghiti.fr>, 
	"Paolo Bonzini" <pbonzini@redhat.com>, 
	"Shuah Khan" <skhan@linuxfoundation.org>, 
	"Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Andrew Jones" <ajones@ventanamicro.com>, 
	"Anup Patel" <anup@brainfault.org>, 
	"Atish Patra" <atish.patra@linux.dev>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Subject: Re: Re: [PATCH v9 2/3] KVM: selftests: Refactor UAPI tests into
 dedicated function
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.1-cmXT5 build
 20240627(e6c6db66) Copyright (c) 2002-2026 www.mailtech.cn cnic.cn
In-Reply-To: <202602280523.Y5Q8Pdft-lkp@intel.com>
References: <20260228005355.823048-3-xujiakai2025@iscas.ac.cn>
 <202602280523.Y5Q8Pdft-lkp@intel.com>
MIME-Version: 1.0
Message-ID: <6f5f1ca4.443dd.19ca2f0f358.Coremail.xujiakai2025@iscas.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: tgCowABnc9OBi6Jp1RITAA--.46891W
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiDAgMCWmiU3VFgAABso
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_223041_522390_4CF25BDF 
X-CRM114-Status: GOOD (  12.50  )
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

SGkgYWxsLAoKSSByZWNlaXZlZCBhIG5vdGlmaWNhdGlvbiBmcm9tIHRoZSBrZXJuZWwgdGVzdCBy
b2JvdCByZWdhcmRpbmcgbXkgcGF0Y2guIEl0IGluZGljYXRlcyB0aGF0IHZvaWQgY2hlY2tfc3Rl
YWxfdGltZV91YXBpKCkgc2hvdWxkIGJlIGNoYW5nZWQgdG8gdm9pZCBjaGVja19zdGVhbF90aW1l
X3VhcGkodm9pZCkgdG8gYXZvaWQgYSBjb21waWxlciB3YXJuaW5nLgoKSSB3b3VsZCBsaWtlIHRv
IHdhaXQgZm9yIHRoZSByZXZpZXdlcnPigJkgZmVlZGJhY2sgb24gdGhpcyBwYXRjaC4gSWYgdGhl
cmUgYXJlIG5vIGlzc3VlcyBhc2lkZSBmcm9tIHRoaXMgd2FybmluZywgSSB3aWxsIHN1Ym1pdCB0
aGUgZmluYWwgdmVyc2lvbiBhZGRyZXNzaW5nIHRoZSBjb21waWxlciB3YXJuaW5nLiBJZiB0aGVy
ZSBhcmUgb3RoZXIgc3VnZ2VzdGlvbnMsIEkgd2lsbCBpbmNvcnBvcmF0ZSB0aGVtIGFjY29yZGlu
Z2x5LgoKVGhhbmtzLApKaWFrYWkKCiZxdW90O2tlcm5lbCB0ZXN0IHJvYm90JnF1b3Q7ICZsdDts
a3BAaW50ZWwuY29tJmd0O+WGmemBk++8mgo+IEhpIEppYWthaSwNCj4gDQo+IGtlcm5lbCB0ZXN0
IHJvYm90IG5vdGljZWQgdGhlIGZvbGxvd2luZyBidWlsZCB3YXJuaW5nczoNCj4gDQo+IFthdXRv
IGJ1aWxkIHRlc3QgV0FSTklORyBvbiB2Ni4xOV0NCj4gW2Nhbm5vdCBhcHBseSB0byBrdm0vcXVl
dWUga3ZtL25leHQgbGludXMvbWFzdGVyIGt2bS9saW51eC1uZXh0IHY3LjAtcmMxIG5leHQtMjAy
NjAyMjddDQo+IFtJZiB5b3VyIHBhdGNoIGlzIGFwcGxpZWQgdG8gdGhlIHdyb25nIGdpdCB0cmVl
LCBraW5kbHkgZHJvcCB1cyBhIG5vdGUuDQo+IEFuZCB3aGVuIHN1Ym1pdHRpbmcgcGF0Y2gsIHdl
IHN1Z2dlc3QgdG8gdXNlICctLWJhc2UnIGFzIGRvY3VtZW50ZWQgaW4NCj4gaHR0cHM6Ly9naXQt
c2NtLmNvbS9kb2NzL2dpdC1mb3JtYXQtcGF0Y2gjX2Jhc2VfdHJlZV9pbmZvcm1hdGlvbl0NCj4g
DQo+IHVybDogICAgaHR0cHM6Ly9naXRodWIuY29tL2ludGVsLWxhYi1sa3AvbGludXgvY29tbWl0
cy9KaWFrYWktWHUvUklTQy1WLUtWTS1WYWxpZGF0ZS1TQkktU1RBLXNobWVtLWFsaWdubWVudC1p
bi1rdm1fc2JpX2V4dF9zdGFfc2V0X3JlZy8yMDI2MDIyOC0wODU2NDgNCj4gYmFzZTogICB2Ni4x
OQ0KPiBwYXRjaCBsaW5rOiAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwMjI4MDA1
MzU1LjgyMzA0OC0zLXh1amlha2FpMjAyNSU0MGlzY2FzLmFjLmNuDQo+IHBhdGNoIHN1YmplY3Q6
IFtQQVRDSCB2OSAyLzNdIEtWTTogc2VsZnRlc3RzOiBSZWZhY3RvciBVQVBJIHRlc3RzIGludG8g
ZGVkaWNhdGVkIGZ1bmN0aW9uDQo+IGNvbmZpZzogYXJtNjQtYWxsbm9jb25maWctYnBmIChodHRw
czovL2Rvd25sb2FkLjAxLm9yZy8wZGF5LWNpL2FyY2hpdmUvMjAyNjAyMjgvMjAyNjAyMjgwNTIz
Llk1UThQZGZ0LWxrcEBpbnRlbC5jb20vY29uZmlnKQ0KPiBjb21waWxlcjogYWFyY2g2NC1saW51
eC1nbnUtZ2NjIChEZWJpYW4gMTQuMi4wLTE5KSAxNC4yLjANCj4gcmVwcm9kdWNlICh0aGlzIGlz
IGEgVz0xIGJ1aWxkKTogKGh0dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2ZS8y
MDI2MDIyOC8yMDI2MDIyODA1MjMuWTVROFBkZnQtbGtwQGludGVsLmNvbS9yZXByb2R1Y2UpDQo+
IA0KPiBJZiB5b3UgZml4IHRoZSBpc3N1ZSBpbiBhIHNlcGFyYXRlIHBhdGNoL2NvbW1pdCAoaS5l
LiBub3QganVzdCBhIG5ldyB2ZXJzaW9uIG9mDQo+IHRoZSBzYW1lIHBhdGNoL2NvbW1pdCksIGtp
bmRseSBhZGQgZm9sbG93aW5nIHRhZ3MNCj4gfCBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9i
b3QgPGxrcEBpbnRlbC5jb20+DQo+IHwgQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9v
ZS1rYnVpbGQtYWxsLzIwMjYwMjI4MDUyMy5ZNVE4UGRmdC1sa3BAaW50ZWwuY29tLw0KPiANCj4g
QWxsIHdhcm5pbmdzIChuZXcgb25lcyBwcmVmaXhlZCBieSA+Pik6DQo+IA0KPiA+PiBzdGVhbF90
aW1lLmM6MjA3OjEzOiB3YXJuaW5nOiBmdW5jdGlvbiBkZWNsYXJhdGlvbiBpc24ndCBhIHByb3Rv
dHlwZSBbLVdzdHJpY3QtcHJvdG90eXBlc10NCj4gICAgICAyMDcgfCBzdGF0aWMgdm9pZCBjaGVj
a19zdGVhbF90aW1lX3VhcGkoKQ0KPiAgICAgICAgICB8ICAgICAgICAgICAgIF5+fn5+fn5+fn5+
fn5+fn5+fn5+fg0KPiAgICBjYzE6IG5vdGU6IHVucmVjb2duaXplZCBjb21tYW5kLWxpbmUgb3B0
aW9uICctV25vLWdudS12YXJpYWJsZS1zaXplZC10eXBlLW5vdC1hdC1lbmQnIG1heSBoYXZlIGJl
ZW4gaW50ZW5kZWQgdG8gc2lsZW5jZSBlYXJsaWVyIGRpYWdub3N0aWNzDQo+IA0KPiAtLSANCj4g
MC1EQVkgQ0kgS2VybmVsIFRlc3QgU2VydmljZQ0KPiBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwv
bGtwLXRlc3RzL3dpa2kNCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8va3ZtLXJpc2N2Cg==
