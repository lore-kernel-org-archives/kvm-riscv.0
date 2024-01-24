From: Thomas Huth <thuth@redhat.com>
Date: Wed, 24 Jan 2024 10:45:29 +0100
Subject: [kvm-unit-tests PATCH 23/24] gitlab-ci: Add riscv64 tests
In-Reply-To: <20240124071815.6898-49-andrew.jones@linux.dev>
References: <20240124071815.6898-26-andrew.jones@linux.dev>
 <20240124071815.6898-49-andrew.jones@linux.dev>
Message-ID: <283af7cb-33fa-4486-a038-0c5a2235ffd5@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 24/01/2024 08.18, Andrew Jones wrote:
> Add build/run tests for riscv64. We would also add riscv32, but Fedora
> doesn't package what we need for that.
> 
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>   .gitlab-ci.yml | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 273ec9a7224b..f3ec551a50f2 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -87,6 +87,22 @@ build-ppc64le:
>        | tee results.txt
>    - if grep -q FAIL results.txt ; then exit 1 ; fi
>   
> +# build-riscv32:
> +# Fedora doesn't package a riscv32 compiler for QEMU. Oh, well.
> +
> +build-riscv64:
> + extends: .intree_template
> + script:
> + - dnf install -y qemu-system-riscv gcc-riscv64-linux-gnu
> + - ./configure --arch=riscv64 --cross-prefix=riscv64-linux-gnu-
> + - make -j2
> + - printf "FOO=foo\nBAR=bar\nBAZ=baz\nMVENDORID=0\n" >test-env
> + - ACCEL=tcg KVM_UNIT_TESTS_ENV=test-env ./run_tests.sh
> +      selftest
> +      sbi
> +      | tee results.txt
> + - if grep -q FAIL results.txt ; then exit 1 ; fi

IIRC it's better to make sure that at least one test passed:

   - grep -q PASS results.txt && ! grep -q FAIL results.txt

Otherwise all tests could be SKIP which indicates that something went wrong, 
too.
We're using the check for PASS for some tests in the gitlab-ci.yml file, but 
not for all ... we should maybe update the remaining ones to use that, too...

  Thomas



