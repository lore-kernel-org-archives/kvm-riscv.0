Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B4CE6E815
	for <kvm-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 05:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DC3t9b7t9qVggZWrmeNHcyFMuOcknjXvQH/zCkom2JU=; b=EBZ2JOyeTwWUtH
	5xWlP0dQoYpzq6KZFRAKAWCizE0S2YHIW6c8RIBYB9MT6SNYCMrIPgCBSHoDDZQr9jMFCllpvIUDU
	cJfxoI+IoCjyJaRmXKRL08SsY/lYx/s+BohEfDxzuU/uApLOlk3ejQEr5q/xle1ZgHrm/0UxlfnAc
	lT7FPdztgjW36fY/UqIQqE8Iooq0H/shpLauT6NTYfcyvL+5gp8/Wel0oo/HO/5d3UaBI6s4XiyGt
	TFHXoHnsxjyCBqYENwKvZlXilzW53btg1t9ICK0zZe7gxiID/Ym6E/FvpQeiT80rzDygE7EXLzhuM
	Tl8lgKsD1zDySXZM2FwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnVi5-00000007xcW-04fv;
	Wed, 04 Feb 2026 05:45:53 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnVi0-00000007xbL-3zva;
	Wed, 04 Feb 2026 05:45:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1770183937; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=kcpw6nzObOocTcTfgP4J3okRdYpVAmfqCq2J3Q4ovjM=;
	b=xMt4OcT7RelzF/YA6DsNe/nGbfwcCo/H+Psouy8oipALZf3PLrf9kAIIsR/BwGr2h0CKib2dwkrCk8bBvvo81J6OIcNjYHikM9+bzj8D+EaH4uq1+c67NHox0LfF+d/FOhnUjcKijgzLjsVOGaG+DgcOC0nEOlFgzTIZ/cJ40w0=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WyVYd-Q_1770183935 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 04 Feb 2026 13:45:37 +0800
From: fangyu.yu@linux.alibaba.com
To: andrew.jones@oss.qualcomm.com
Cc: alex@ghiti.fr,
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
	pjw@kernel.org,
	radim.krcmar@oss.qualcomm.com
Subject: Re: Re: [PATCH v4 2/4] RISC-V: KVM: Detect and expose supported HGATP G-stage modes 
Date: Wed,  4 Feb 2026 13:45:34 +0800
Message-Id: <20260204054534.89560-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <fazd2fcfuwldtrarm6aw26qa5g6fcieoa35xz3bwchif6qfutw@xuvspa4e533b>
References: <fazd2fcfuwldtrarm6aw26qa5g6fcieoa35xz3bwchif6qfutw@xuvspa4e533b>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_214549_624821_3B5FC247 
X-CRM114-Status: GOOD (  15.09  )
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

Pj4gPj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20+Cj4+ID4+
Cj4+ID4+IEV4dGVuZCBrdm1fcmlzY3ZfZ3N0YWdlX21vZGVfZGV0ZWN0KCkgdG8gcHJvYmUgYWxs
IEhHQVRQLk1PREUgdmFsdWVzCj4+ID4+IHN1cHBvcnRlZCBieSB0aGUgaG9zdCBhbmQgcmVjb3Jk
IHRoZW0gaW4gYSBiaXRtYXNrLiBLZWVwIHRyYWNraW5nIHRoZQo+PiA+PiBtYXhpbXVtIHN1cHBv
cnRlZCBHLXN0YWdlIHBhZ2UgdGFibGUgbGV2ZWwgZm9yIGV4aXN0aW5nIGludGVybmFsIHVzZXJz
Lgo+PiA+Pgo+PiA+PiBBbHNvIHByb3ZpZGUgbGlnaHR3ZWlnaHQgaGVscGVycyB0byByZXRyaWV2
ZSB0aGUgc3VwcG9ydGVkLW1vZGUgYml0bWFzawo+PiA+PiBhbmQgdmFsaWRhdGUgYSByZXF1ZXN0
ZWQgSEdBVFAuTU9ERSBhZ2FpbnN0IGl0Lgo+PiA+Pgo+PiA+PiBTaWduZWQtb2ZmLWJ5OiBGYW5n
eXUgWXUgPGZhbmd5dS55dUBsaW51eC5hbGliYWJhLmNvbT4KPj4gPj4gLS0tCj4+ID4+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9nc3RhZ2UuaCBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20va3ZtX2dzdGFnZS5oCj4+ID4+IEBAIC03NSw0ICs3Niw0MCBAQCB2b2lkIGt2
bV9yaXNjdl9nc3RhZ2Vfd3BfcmFuZ2Uoc3RydWN0IGt2bV9nc3RhZ2UgKmdzdGFnZSwgZ3BhX3Qg
c3RhcnQsIGdwYV90IGVuZAo+PiA+PiArZW51bSBrdm1fcmlzY3ZfaGdhdHBfbW9kZV9iaXQgewo+
PiA+PiArCUhHQVRQX01PREVfU1YzOVg0X0JJVCA9IDAsCj4+ID4+ICsJSEdBVFBfTU9ERV9TVjQ4
WDRfQklUID0gMSwKPj4gPj4gKwlIR0FUUF9NT0RFX1NWNTdYNF9CSVQgPSAyLAo+PiA+Cj4+ID5J
IHRoaW5rIGl0J3MgYSBiaXQgYXdrd2FyZCB0byBwYXNzIDkgd2hlbiBzZWxlY3RpbmcgdGhlIGhn
YXRwIG1vZGUsIGJ1dAo+PiA+dGhlbiBsb29rIGZvciBiaXQgMCB3aGVuIGRldGVjdGluZyBpdC4u
Lgo+PiA+V2h5IG5vdCB0byB1c2UgdGhlIFJWSSBkZWZpbmVkIHZhbHVlcyBmb3IgdGhpcyBVQUJJ
IGFzIHdlbGw/Cj4+ID4KPj4gPlRoZXJlIGFyZSBvbmx5IDE2IHBvc3NpYmxlIGhnYXRwLm1vZGUg
dmFsdWVzLCBzbyB3ZSdyZSBmaW5lIHN0b3JpbmcgdGhlbQo+PiA+aW4gYSBiaXRtYXAgZXZlbiBv
biBSVjMyLgo+Pgo+PiBJIHRoaW5rIHRoaXMgaXMgYSBnb29kIHBvaW50Lgo+Pgo+PiBVc2luZyBs
b2dpY2FsIGJpdHMgMC8xLzIgaXMgaW5kZWVkIGxlc3MgaW50dWl0aXZlIHRoYW4gdGVzdGluZwo+
PiBCSVQoSEdBVFBfTU9ERV9TVjM5WDQpIHdoZW4gdXNlcnNwYWNlIHBhc3NlcyB0aGUgYXJjaGl0
ZWN0dXJhbCBIR0FUUC5NT0RFCj4+IGVuY29kaW5nLgo+Pgo+PiBIb3dldmVyLCBpZiB3ZSB1c2Ug
4oCcSEdBVFAuTU9ERSBlbmNvZGluZyBhcyBiaXQgaW5kZXjigJ0sIHdlIG5lZWQgdG8gZXhwb3J0
Cj4+IHRob3NlIGVuY29kaW5ncyB0byB1c2Vyc3BhY2UuIFRvZGF5IEhHQVRQX01PREVfKiBhcmUg
bm90IHBhcnQgb2YgdGhlCj4+IFVBUEksIHNvIHVzZXJzcGFjZSB3b3VsZCBuZWVkIHRvIGhhcmRj
b2RlIG1hZ2ljIG51bWJlcnMuCj4+Cj4+IFNvIGlmIHdlIGdvIHdpdGggdGhpcyBhcHByb2FjaCwg
SeKAmWxsIGFkZCBVQVBJIGRlZmluaXRpb25zIGZvciB0aGUgSEdBVFAKPj4gbW9kZSBlbmNvZGlu
Z3MgKGUuZy4gI2RlZmluZSBLVk1fUklTQ1ZfSEdBVFBfTU9ERV9TVjM5WDRfQklUICA4LCBldGMu
KSBhbmQKPj4gdGhlbiBkZWZpbmUgdGhlIHJldHVybmVkIGJpdG1hc2sgYXMgQklUKG1vZGUpLgo+
Cj5UaGUgYmVzdCBwYXJ0IG9mIFJhZGltJ3Mgc3VnZ2VzdGlvbiBpcyB0aGF0IHRoZXJlIGlzIG5v
IG5lZWQgdG8gYWRkIHRoZQo+Yml0cyB0byBVQVBJLiBXZSBjYW4gd3JpdGUgaW4gdGhlIGRvY3Vt
ZW50YXRpb24gZm9yIHRoZSBjYXBhYmlsaXR5IHRoYXQKPnRoZSBtb2RlIHZhbHVlcyBtYXRjaCB0
aGUgc3BlYy4ga3ZtIHVzZXJzcGFjZSBjYW4gdGhlbiBqdXN0IGxvb2sgYXQgdGhlCj5zcGVjIHRv
IGRldGVybWluZSB0aG9zZSB2YWx1ZXMgYW5kIGNyZWF0ZSBpdHMgb3duIGRlZmluZXMgKHdoaWNo
IFFFTVUsCj5mb3IgZXhhbXBsZSwgaGFzIGNlcnRhaW5seSBhbHJlYWR5IGRvbmUpLgoKTWFrZXMg
c2Vuc2UsIHRoYW5rcy4KCklmIHdlIHVzZSB0aGUgYXJjaGl0ZWN0dXJhbCBIR0FUUC5NT0RFIGVu
Y29kaW5nIGFzIHRoZSBiaXQgaW5kZXgsIHdlIGNhbgppbmRlZWQgYXZvaWQgYWRkaW5nIGFueSBl
eHRyYSAqX0JJVCBvciBtb2RlIGNvbnN0YW50cyB0byB0aGUgVUFQSS4KCk5vdCBzdXJlIHdoeSBt
eSByZXBsaWVzIGRpZG7igJl0IGdvIHRocm91Z2ggeWVzdGVyZGF5LgoKVGhhbmtzIGZvciB0aGUg
cmV2aWV3LiBJ4oCZbGwgaW5jb3Jwb3JhdGUgdGhpcyBmZWVkYmFjayBhcyB3ZWxsIGFzIHlvdXIK
b3RoZXIgc3VnZ2VzdGlvbnMgYW5kIGFkZHJlc3MgdGhlbSBpbiB0aGUgbmV4dCByZXZpc2lvbiBv
ZiB0aGUgc2VyaWVzLgo+Cj5UaGFua3MsCj5kcmV3CgpUaGFua3MsCkZhbmd5dQoKLS0gCmt2bS1y
aXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
