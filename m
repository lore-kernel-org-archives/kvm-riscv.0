Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2674CCF2C4
	for <kvm-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 12:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UZfuqqpj0acP+TZ78oFBFjQ3viEqF3GWFUTkEAuwr0U=; b=nKBYr/ea8GAC2/
	yM3Gdift8n7IXZ8KkLPIDv63xOljP4ZrgqXwK167l7IwkTi4eBm9PNoRiiyygJUVedZoknssDGvN5
	L9/QEra2uEky3jNNmnsDEC43/HPwdZIWsKUecQ+Ank6pwNkB+rERQhCdCO5vYAEjQZQM1lrIb7aSL
	Ydb95uZVn4+1EcUOiQl+ycuzA1lIlwVIfNuIDvfriUu1jkb3nxorpgi6wQhJ3Ot+lPInDeSqTY+yq
	onL0+as1ai4YbBEgNAy9lLJF0iPlr0JEclPsSBY2v6PNwvfKnqFJXUER2VQo2CWZkW7AAaiFrLXEc
	1YgVXYK36jd4lJEAgS5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI3XH-00000004kw4-3u3q;
	Sat, 17 Oct 2026 12:29:15 +0000
Received: from out-67.mta0.migadu.com ([2001:41d0:1004:224b::43] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI3XC-00000004kv7-2wjv
	for kvm-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 12:29:14 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=7cgiKM+zDuDnTZJRzu5yT4bUih3KcyLUsgr/rzH4uiM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792240147; v=1; x=1792844947;
 b=uEPEzbwHu/tt5chmzaFb5qbVqI83ww2eE1GF8KosR6AjlTOwmdTEqJ94CSeZ1UR51kiAx4qU
 CQ6i+LLjOUvmP5QAsneUi7HxbRTR4MpxqAxhRPKJiUN89DM6oNRSjQvW2EtOVpxuAxoyEjCMvhc
 HMVUxPFgifG0cH94YLDLxAvg=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4ced6db5906c4a15;
	Sat, 17 Oct 2026 12:29:07 +0000
X-Mizu-Trace-ID: 4ced6db5906c4a15
X-Migadu-Flow: FLOW_OUT
Date: Sat, 17 Oct 2026 14:29:06 +0200
From: Andrew Jones <andrew.jones@linux.dev>
To: Anup Patel <anup@brainfault.org>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	kvm-riscv@lists.infradead.org, atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: KVM: Use a raw lock for IMSIC wakeup state
Message-ID: <atNpO4nRuijDH6l-@orel>
References: <20260925155116.465203-1-andrew.jones@oss.qualcomm.com>
 <CAAhSdy0Y8kQ=gsiX0QX6Ntq=fL89METhA0s7G3niBBJrHpue7A@mail.gmail.com>
 <7zy352odf4hekcibmio3atunubffzxfcsqnn55q6sfkksnynfj@5bx263nnizdm>
 <CAAhSdy2mAs6UgTk-hbGd3DX_1242Jpy9WLnOp6kmPvVVtABWHw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy2mAs6UgTk-hbGd3DX_1242Jpy9WLnOp6kmPvVVtABWHw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_052911_819861_671DAFEA 
X-CRM114-Status: GOOD (  15.36  )
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

T24gRnJpLCBPY3QgMDksIDIwMjYgYXQgMDY6Mzc6MTNQTSArMDIwMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBGcmksIE9jdCA5LCAyMDI2IGF0IDM6NDTigK9QTSBBbmRyZXcgSm9uZXMKPiA8YW5k
cmV3LmpvbmVzQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+ID4KPiA+IEhpIEFudXAsCj4gPgo+
ID4gT24gRnJpLCBPY3QgMDksIDIwMjYgYXQgMDE6NDU6MjBQTSArMDIwMCwgQW51cCBQYXRlbCB3
cm90ZToKPiA+ID4gT24gRnJpLCBTZXAgMjUsIDIwMjYgYXQgNTo1MeKAr1BNIEFuZHJldyBKb25l
cwo+ID4gPiA8YW5kcmV3LmpvbmVzQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+ID4gPiA+Cj4g
PiA+ID4ga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX3B1dCgpIGNhbiBydW4gZnJvbSB0aGUgc2No
ZWR1bGVyIHByZWVtcHRpb24KPiA+ID4gPiBub3RpZmllciB3aGlsZSB0aGUgcmF3IHJ1bnF1ZXVl
IGxvY2sgaXMgaGVsZC4gVGFraW5nIHZzZmlsZV9sb2NrLCBhbgo+ID4gPiA+IHJ3bG9ja190LCB0
aGVyZSB2aW9sYXRlcyB0aGUgbG9ja2RlcCB3YWl0LWNvbnRleHQgcnVsZXMuCj4gPiA+ID4KPiA+
ID4gPiBQcm90ZWN0IHRoZSBDUFUvSEdFSSBwYWlyIHdpdGggYSBzZXBhcmF0ZSByYXcgc3Bpbmxv
Y2suIEFsbCB1cGRhdGVzIHRvCj4gPiA+ID4gdGhhdCBwYWlyIHJldGFpbiB2c2ZpbGVfbG9jayBh
bmQgdGFrZSB0aGUgbmV3IGxvY2ssIHdoaWxlIHNjaGVkdWxlci1vdXQKPiA+ID4gPiB1c2VzIG9u
bHkgdGhlIG5ldyBsb2NrIGFyb3VuZCB0aGUgSEdFSUUgdXBkYXRlLiBUaGlzIGtlZXBzIHRoZSB3
YWtldXAKPiA+ID4gPiBzZXR1cCBzZXJpYWxpemVkIHdpdGggVlMtZmlsZSBwdWJsaWNhdGlvbiBh
bmQgcmVsZWFzZSB3aXRob3V0IGJyaW5naW5nCj4gPiA+ID4gd2lkZXIgSU1TSUMgb3BlcmF0aW9u
cyBpbnRvIGEgcmF3IGNyaXRpY2FsIHNlY3Rpb24uCj4gPiA+Cj4gPiA+IEluc3RlYWQgb2YgaW50
cm9kdWNpbmcgYW5vdGhlciBsb2NrLCB3aHkgbm90IHJlcGxhY2UKPiA+ID4gcmVhZF9sb2NrX2ly
cXNhdmUoJmltc2ljLT52c2ZpbGVfbG9jaywgZmxhZ3MpIHdpdGgKPiA+ID4gd3JpdGVfbG9ja19p
cnFzYXZlKCZpbXNpYy0+dnNmaWxlX2xvY2ssIGZsYWdzKSBpbgo+ID4gPiBrdm1fcmlzY3ZfdmNw
dV9haWFfaW1zaWNfcHV0KCkgPz8KPiA+Cj4gPiBVbmZvcnR1bmF0ZWx5LCB3cml0ZV9sb2NrX2ly
cXNhdmUoKSBoYXMgdGhlIHNhbWUgUFJFRU1QVF9SVCBpc3N1ZSwgc2luY2UKPiA+IHJ3bG9ja190
IGlzIHNsZWVwYWJsZSBvbiBSVCBpbiBib3RoIG1vZGVzLgo+ID4KPiAKPiBJIGFtIG5vdCBmb25k
IG9mIG5lc3RlZCBsb2NraW5nLCB3aHkgbm90IGNvbnZlcnQgdnNmaWxlX2xvY2sgaW50byByYXcK
PiBzcGlubG9jayA/Pwo+CgpXZSBjYW4gZG8gdGhhdC4gVGhlIHJlYWRlciBjb25jdXJyZW5jeSB0
aGUgcndsb2NrIGdhdmUgdXMgd2FzIG9ubHkgZm9yCnRpbnkgc2VjdGlvbnMgYW55d2F5LiBJJ2xs
IHNlbmQgYSB2Mi4KClRoYW5rcywKZHJldyAKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2
bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
