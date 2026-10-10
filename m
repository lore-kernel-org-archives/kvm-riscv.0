Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721DACA6017
	for <kvm-riscv@archiver.kernel.org>; Sat, 10 Oct 2026 08:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fnR6LyQXLtBpaouqmth2HBnhsJ5Fegcy0wxIoLxvI4Q=; b=Fsl26F03klSfAc
	DX6iOHSKJ/cXpsBKZlPxeAkWLOVodENOCW1Wwa3+bNCPc/4FOSvS2F22lVVWyRX5JMAHsFVlcHsy0
	ddknrr6KnZl9wQGQInHODpRo649JdiaAlVFXYCTLQcv5oce5goBcPxavg40qeYBtKoGwBOpTlNQUe
	+UrkHLKEshHXWwrbSn1WHVi8zGy5Rzzj+oTSJzRWxvy0Gb55dGpnA3FGx0c6TNqVa8GUjnfv+Yi5G
	CHveQb48C0nTtjPh5rLO6mt9OKUdQREe15DPoX14sn8EmNggzt4ARNp65Mni4HXut8CAb+RVlC8aQ
	n4cbf4iOCJRDsWcfikEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFSnp-00000007i97-39HC;
	Sat, 10 Oct 2026 08:51:37 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFSnm-00000007i78-2XYK
	for kvm-riscv@lists.infradead.org;
	Sat, 10 Oct 2026 08:51:36 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48c4be28b82so412869f8f.2
        for <kvm-riscv@lists.infradead.org>; Sat, 10 Oct 2026 01:51:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791622293; cv=none;
        d=google.com; s=arc-20260327;
        b=GwMrw8VDZKYJHAtGMgFI7ztM7Idbf9kUUbYrp+awBU9KMKVpg2LjvrMY74I6+qTQiJ
         kO9RlVOpa8j+fBuALGmLOkgBulpN+qUFiNuC06mm3z3HBzWADjFo6JG7sEpFHAm3gKTt
         O9gKWJ5RY1PbWrcydDsznnANtj7tTCvs3YczxgNSzRtGqn7dSIeBMT+WrDhTAxRtla59
         6pBP2tiwdrKZR2pynCZVPw5Kf7d6HQsKa4yilUJZtGOnj1U4Tt4O1XgJGa3XU12lp9f0
         V0hviwasJf6rag7wE8GhPH5agzT+JxvsOEw6gecYmKIBIMh1V2tDD263sBEQUICILPR8
         oZiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C6tCpuU1dy+mG56KK8qDndK4H2Po4jPbRKZ0gvmsaI0=;
        fh=Sctbd/OaJ9x0n4Ti9v1472isvhWmzUrWEv62ZjNl/pM=;
        b=Ll7GrflWnIzug36n5VHmyouSDMB0FUiMpgKKOKkAlwbDQOJxJ3OgRODo97JDH8r8Yz
         jIa00tOkdHRRIY2hNLPqx9L2Dm2J+v4PWsftvfX+ZUT7p9eI6SMnyyvX1iaDPE+apM3G
         O45CQgxYu3io89Fmbt9cV+gT/iBA93MeMaKlXIoXW/PebnmctXOt3IUgn9kfCzT4oLSV
         60kKfF9BeBH8zArxUisJ+/gKAqvwTcW5IhiFoBjo6HXrWiAC6Wb9xMG11nsNAW9/ZvDw
         xqlcArBW9Xqnk6YRUQ5v9+Ea4G7D91dzEYdUpaOrd48CO3/PU76m+8ltOefYlCCVeBV+
         g2oA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791622293; x=1792227093; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C6tCpuU1dy+mG56KK8qDndK4H2Po4jPbRKZ0gvmsaI0=;
        b=jgGrXyib0K2AD7aoQasnXpnA/tf2n0WqZQMcXiLTFJgIP1N+12nDOIPvQkfm1XGjJ/
         ARUDLq9KjF8P4qqq51Dka8OszLOFH7qY4EyM2XAWHpwMs62v+IG0SNNE1+l1FYcdq4uD
         drJxOUsWz8Btm93+qshX9CdaBPWIJTl4dVKZyEZ6jHF8xWaI2MhpC3jrYmQqjPxj3w4O
         gflcw5X4haV6a4cD5V01gfq8S7vsZ7pUOhlIh7ctl57/aCxJa6ngMMZ79fRHuOrtv8jx
         St2v7Lvj2K4Vo1NItr4Ao3jgLb9ApzyX0sbSdCH/bybGCxqRJtfKJCC0R/cBxSxokzNZ
         LODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791622293; x=1792227093;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C6tCpuU1dy+mG56KK8qDndK4H2Po4jPbRKZ0gvmsaI0=;
        b=Qq0iKzo+SllP8cFLzPTeU2PIv5IxX7nqyuQjT0NtNf9QCXmiULC5B/h3wAE2NdkVji
         7MVID0S/YscfU9FiyafI7KQ/6nxtmN9tX37IEn+Z8RtCo07505kkwmhLhadrO5K77hmc
         W8vh9GzEmmUm1sHWvFwY9wclxQq152lldpOPdRp/6P5lEKBsG4HBdsJDnfnxV9V8sn16
         pQ+P2dwQiu1T9tLTBRTJvfFSmz0YoPEnqyY0EIN5ZzxEjo+ckLFD20m/pDH+AndpcLu0
         kYcKa+FJ3bdy1jOWL4JxY6KISXznTjsqoLeDm0abtESPp1OWp9RD7EHOVMlF3y7jD5Ou
         fmsQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/qr+Jdj974f3cVIb0zCQTZzle+SbLOxI7i5Uf6xZMJZBL8hgaSq2vY3RVpRLi6h+VJJPpm/4JBmU=@lists.infradead.org
X-Gm-Message-State: AFq9FYII5AW1V7wF/qDaK3Lxx/R8UJzGmAqZWfkeLCiFD0XJKxjj40bv
	J4/k4R5NgK3Aps95MSlKmK0lv5cDU/eclTJrplF1jWw9y3Mz+PXbP+BTaBK2jMgalDK+KrolNrd
	r5Q3pDgP7PFAeqpIkyajrhYHzIt5VSyfUm2VbsGmdKQ==
X-Gm-Gg: AYBFou3GFDiDqqGtZM7Pgf+CHamE5WVWOFlMphHXTH7lxZ1vUEfiAJCSuKmSz3U7AXT
	rv8gB/pHSmaUKJREOo9DeO1WnKhj8Ssn31SoDLmpF/AWQQQaZEXKPPLxT/VdTeXjjq0DWqfngJ1
	PE9+Soa+qqd6mWEKVfBqi89XKwN7Nq6OFcPEosLLMZl8q58yAh/LPVgU/3y/fRBvmwqC3uRhTj+
	D/6F72C3ypMjb4U/ZBT4hG/B+rJsa7xMizEJHG6HSCuCbvLKK0o5DEIx2FMldDNGl2XE9UG0akq
	Xk1T+R1brzyGdn5Keg8/AviY3OJo/AnErmz97ucpQlXvA874viQxCMSBrCSWmSh5T1lgiLnnsvi
	S3/cYHpxoORotXJ968FVqUNtVLUyj+A659VE8b9ZYUpMtRE/jL4mrFvL5ejxHEd295VWyT8acCA
	==
X-Received: by 2002:a05:600c:3b0a:b0:4a1:6fa9:48ad with SMTP id
 5b1f17b1804b1-4a18e4a9b9amr83263995e9.26.1791622292538; Sat, 10 Oct 2026
 01:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260827211209.2871124-1-dave@stgolabs.net> <CAAhSdy1OUpQUFtQ0Cp0BgSqnxHYUnnCZ0wVsDKz4S57YUa+1cA@mail.gmail.com>
 <7d4d21b8-9993-4b76-be0e-2a3b76c0d0f5@sifive.com>
In-Reply-To: <7d4d21b8-9993-4b76-be0e-2a3b76c0d0f5@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 10 Oct 2026 10:51:21 +0200
X-Gm-Features: AclHuK-5wyIphSA0Dve82FO0PJ8IbHztaMBSv1TG-JspxEZf9pXBzgsTYnWEWeM
Message-ID: <CAAhSdy371da4PnzHLsqS0WFso6PSUvgsVC+fg_wWFymqZPNREQ@mail.gmail.com>
Subject: Re: [PATCH] riscv/kvm: Only context-switch senvcfg where it exists
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_015134_704475_E3E18903 
X-CRM114-Status: GOOD (  20.41  )
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

T24gU2F0LCBPY3QgMTAsIDIwMjYgYXQgMTA6MjPigK9BTSBTYW11ZWwgSG9sbGFuZAo8c2FtdWVs
LmhvbGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBIaSBBbnVwLAo+Cj4gT24gMjAyNi0xMC0w
OSA5OjIzIFBNLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gT24gVGh1LCBBdWcgMjcsIDIwMjYgYXQg
MTE6MTLigK9QTSBEYXZpZGxvaHIgQnVlc28gPGRhdmVAc3Rnb2xhYnMubmV0PiB3cm90ZToKPiA+
Pgo+ID4+IHNlbnZjZmcgYXJyaXZlZCBpbiBwcml2aWxlZ2VkIHNwZWMgMS4xMiwgYnV0IEgtY2Fw
YWJsZSBjb3JlcyBvbiBhCj4gPj4gMS4xMSBiYXNlIGV4aXN0LCBpZTogc2lmaXZlIFA1MDAgKEVT
V0lOIEVJQzc3MDBYKSBpbXBsZW1lbnRzIHRoZQo+ID4+IGh5cGVydmlzb3IgZXh0ZW5zaW9uIHll
dCBoYXMgbm8gc2VudmNmZy4gS1ZNIHN3YXBzIHRoZSBDU1IKPiA+PiB1bmNvbmRpdGlvbmFsbHkg
b24gZXZlcnkgdkNQVSBlbnRyeSwgcGFuaWNpbmcgdGhlIGhvc3QgdXBvbiBhIGd1ZXN0Cj4gPj4g
ZXhlY3V0aW5nIGl0cyBmaXJzdCBpbnN0cnVjdGlvbjoKPiA+Pgo+ID4+ICAgT29wcyAtIGlsbGVn
YWwgaW5zdHJ1Y3Rpb24gWyMxXQo+ID4+ICAgTW9kdWxlcyBsaW5rZWQgaW46IGt2bQo+ID4+ICAg
Q1BVOiAyIFVJRDogMCBQSUQ6IDEyNyBDb21tOiBxZW11LXN5c3RlbS1yaXMgTm90IHRhaW50ZWQg
Ny4yLjAta3ZtNzNidWcrICM0IFBSRUVNUFRMQVpZCj4gPj4gICBIYXJkd2FyZSBuYW1lOiBVbmtu
b3duIFVua25vd24gUHJvZHVjdC9Vbmtub3duIFByb2R1Y3QsIEJJT1MgMjAyNC4wMSAwMS8wMS8y
MDI0Cj4gPj4gICBlcGMgOiBrdm1fcmlzY3ZfdmNwdV9lbnRlcl9leGl0KzB4MjYvMHhjZjggW2t2
bV0KPiA+PiAgICByYSA6IGt2bV9hcmNoX3ZjcHVfaW9jdGxfcnVuKzB4NGNlLzB4NWE2IFtrdm1d
Cj4gPj4gICBzdGF0dXM6IDAwMDAwMDAyMDAwMDAxMDAgYmFkYWRkcjogMDAwMDAwMDAxMGE3OTdm
MyBjYXVzZTogMDAwMDAwMDAwMDAwMDAwMgo+ID4+ICAgWzxmZmZmZmZmZjAxZGY0MzJlPl0ga3Zt
X3Jpc2N2X3ZjcHVfZW50ZXJfZXhpdCsweDI2LzB4Y2Y4IFtrdm1dCj4gPj4gICBbPGZmZmZmZmZm
MDFkZWIzYjA+XSBrdm1fYXJjaF92Y3B1X2lvY3RsX3J1bisweDRjZS8weDVhNiBba3ZtXQo+ID4+
ICAgWzxmZmZmZmZmZjAxZGQ3OTE0Pl0ga3ZtX3ZjcHVfaW9jdGwrMHgxODAvMHg1ZTQgW2t2bV0K
PiA+PiAgIFs8ZmZmZmZmZmY4MDI1NzAyZT5dIF9fcmlzY3Zfc3lzX2lvY3RsKzB4ODQvMHg5YQo+
ID4+ICAgWzxmZmZmZmZmZjgwZGZkYzcyPl0gZG9fdHJhcF9lY2FsbF91KzB4MWQ4LzB4MzhhCj4g
Pj4gICBbPGZmZmZmZmZmODBlMDg2NDQ+XSBoYW5kbGVfZXhjZXB0aW9uKzB4MTY4LzB4MTc0Cj4g
Pj4gICBDb2RlOiA4NGFhIDg5MmUgYjcwMyA4ODg3IDE3NzMgMTA2NyAzMDIzIDE2ZTUgYjc4MyA4
OTA3ICg5N2YzKSAxMGE3Cj4gPj4KPiA+PiBUb3VjaCB0aGUgQ1NSIG9ubHkgd2hlbiBSSVNDVl9J
U0FfRVhUX1hMSU5VWEVOVkNGRyBpcyBzZXQsIHNpbWlsYXIKPiA+PiB0byBfX3N3aXRjaF90b19l
bnZjZmcoKSBhcyB3ZWxsIGFzIG90aGVyIHN3YXBzIGNvbmRpdGlvbmFsIG9uCj4gPj4gdGhlaXIg
ZXh0ZW50aW9ucy4KPiA+Pgo+ID4+IEZpeGVzOiBkYjNjMDFjN2EzMDggKCJSSVNDVjogS1ZNOiBB
ZGQgc2VudmNmZyBjb250ZXh0IHNhdmUvcmVzdG9yZSIpCj4gPj4gU2lnbmVkLW9mZi1ieTogRGF2
aWRsb2hyIEJ1ZXNvIDxkYXZlQHN0Z29sYWJzLm5ldD4KPiA+Cj4gPiBZb3VyIHBhdGNoIGlzIG9u
bHkgY2hlY2tpbmcgUklTQ1ZfSVNBX0VYVF9YTElOVVhFTlZDRkcgd2hlbgo+ID4gc2F2aW5nL3Jl
c3RvcmluZyBzZW52Y2ZnIGJ1dCBub3QgY2hlY2tpbmcgUklTQ1ZfSVNBX0VYVF9YTElOVVhFTlZD
RkcKPiA+IHdoZW4gYWNjZXNzaW5nIGhlbnZjZmcuIFRoaXMgdGVsbHMgbWUgdGhhdCBQNTAwIHNv
bWVob3cgbWFuYWdlcyB0bwo+ID4gaW1wbGVtZW50IGhlbnZjZmcgYnV0IGZvcmdvdCB0byBpbXBs
ZW1lbnQgc2VudmNmZy4gQ2xlYXJseSwgY2hlY2tpbmcKPiA+IFJJU0NWX0lTQV9FWFRfWExJTlVY
RU5WQ0ZHIGlzIG5vdCB0aGUgcmlnaHQgYXBwcm9hY2guCj4KPiBBcyB0aGUgb3RoZXIgcmVwbGll
cyBoYXZlIG1lbnRpb25lZCwgdGhpcyBnZW5lcmF0aW9uIG9mIFA1NTAgZG9lcyBub3QgaW1wbGVt
ZW50Cj4gaGVudmNmZyBlaXRoZXIuIEkgYmVsaWV2ZSBjaGVja2luZyBSSVNDVl9JU0FfRVhUX1hM
SU5VWEVOVkNGRyB3b3VsZCBiZQo+IHN1ZmZpY2llbnQgaGVyZS4gVGhlIG9ubHkgY29uY2VybiBp
cyB0aGF0IHJpc2N2LGlzYS1leHRlbnNpb25zID0gImgiCj4gc3BlY2lmaWNhbGx5IHJlZmVyZW5j
ZXMgSVNBIHZlcnNpb24gMjAyMTEyMDMsIHdoaWNoIGluY2x1ZGVzIFNzMXAxMiwgc28KPiBSSVND
Vl9JU0FfRVhUX0ggc2hvdWxkIGltcGx5IFJJU0NWX0lTQV9FWFRfWExJTlVYRU5WQ0ZHLgoKWWVz
LCB0aGlzIHdhcyBteSBuZXh0IGNvbW1lbnQgYXMgd2VsbC4gUHJlc2VuY2Ugb2YgSC1leHRlbnNp
b24gc2hvdWxkCmltcGx5IFhMSU5VWEVOVkNGRyBkdWUgaGVudmNmZyBDU1IuCgo+Cj4gPiBJbnN0
ZWFkLCBJIHN1Z2dlc3QgaW50cm9kdWNpbmcgc3RhdGljLWtleSBrdm1fcmlzY3Zfbm9fc2VudmNm
ZyBhbmQgc2V0Cj4gPiBpdCBvbmx5IGZvciBQNTAwIChFU1dJTiBFSUM3NzAwWCkgaW4ga3ZtX3Jp
c2N2X3NldHVwX3ZlbmRvcl9mZWF0dXJlcygpLgo+ID4gQWxzbywgZG9uJ3Qgc2F2ZS9yZXN0b3Jl
IHNlbnZjZmcgQ1NSIG9ubHkgd2hlbiBrdm1fcmlzY3Zfbm9fc2VudmNmZyBpcwo+ID4gc2V0Lgo+
Cj4gT3IgbWF5YmUgd2Ugc2hvdWxkIGFkZCBhIG5ldyByaXNjdixpc2EtZXh0ZW5zaW9ucyA9ICJo
MHA2IiBvciBzaW1pbGFyLiBUaGlzCj4gd291bGQgbm90IGltcGx5IFJJU0NWX0lTQV9FWFRfWExJ
TlVYRU5WQ0ZHIGJ1dCB3b3VsZCBvdGhlcndpc2UgYmUgdGhlIHNhbWUgdGhlCj4gc2FtZSBhcyAi
aCIuCgpJdHMgbm90IGxpa2Ugd2Ugd2lsbCBoYXZlIG1vcmUgUklTQy1WIENQVXMgd2l0aCBILWV4
dGVuc2lvbiB2MC42IHNvCmxldCdzIG5vdCBpbnRyb2R1Y2Ugc3ludGhldGljICJoMHA2IiBpc2Eg
ZXh0ZW5zaW9uLgoKSSB0aGluayBoYXZpbmcgc3RhdGljLWtleSBrdm1fcmlzY3Zfbm9feGVudmNm
ZyBpcyBtdWNoIGNsZWFuZXIKYmVjYXVzZSB3ZSBhbHJlYWR5IGhhdmUga3ZtX3Jpc2N2X3Zzc3Rh
Z2VfdGxiX25vX2dwYSB3aGljaAppcyBhbm90aGVyIHdvcmstYXJvdW5kLiBUaGUga3ZtX3Jpc2N2
X25vX3hlbnZjZmcgd2lsbCBiZSBkaWFibGVkCmJ5IGRlZmF1bHQgYW5kIHdpbGwgYmUgZW5hYmxl
ZCBvbmx5IGZvciBQNTAwIChFU1dJTiBFSUM3NzAwWCkuCgpSZWdhcmRzLApBbnVwCgotLSAKa3Zt
LXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
